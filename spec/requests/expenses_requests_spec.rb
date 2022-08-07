require 'rails_helper'

RSpec.describe "Expenses", type: :request do

  let(:current_user) { create(:user) }

  let(:user) { current_user }

  before { sign_in current_user }

  describe "GET #index" do
    subject { get root_path }

    context "user doesn't exist" do
      before(:each) do
        sign_out user
        subject
      end
      it "redirects to login page" do
        expect(response.status).to redirect_to new_user_session_path
      end
    end

    context "user exists" do
      before(:each) { subject }
      it "returns successful response and renders index page" do
        expect(response.status).to render_template(:index)
      end
    end
  end

  # New

  describe "GET #new" do
    subject { get new_expense_path }
    before(:each) { subject }

    context "successful request" do
      it "returns successful response and renders new form" do
        expect(response).to render_template(:new)
      end

      it "sends a new expense" do
        expect(assigns(:expense)).to be_a(Expense)
        expect(assigns(:expense)).to be_a_new(Expense)
      end
    end
  end

  describe "POST #create" do
    let(:expense_params) do
      { title: 'Saturday taxi',
        description: 'From friends to home',
        category: 'Other',
        amount: 100,
        user_id: current_user,
        created_at: Time.now }
    end

    subject { post expenses_path(expense: expense_params) }

    context "not authorized user" do
      before(:each) do
        sign_out current_user
        subject
      end

      it "has status unauthorized" do
        expect(response.status).to eq(302)
        expect(response.body).to redirect_to(new_user_session_path)
      end
    end

    context 'correct params are passed' do
      it 'has successful status' do
        subject
        expect(response.status).to eq(302)
      end

      it 'adds new object to db' do
        expect{subject}.to change(Expense, :count).by(1)
      end
      it "renders new template" do
        subject
        expect(response.status).to redirect_to(expense_path(Expense.last))
      end
    end
  end

  # Show

  describe "GET #show" do
    subject { get expense_path(expense) }
    before(:each) { subject }

    context "successful request" do
      let(:expense) { create(:expense, user: current_user) }
      it "returns successful response and renders show page" do
        expect(response.status).to render_template(:show)
      end
    end

    context "pass expense" do
      let(:expense) { create(:expense, user: current_user) }
      it "returns valid expense" do
        expect(assigns(:expense)).to be_a(Expense)
        expect(assigns(:expense)).to eq(expense)
      end
    end
  end

  describe "DELETE #destroy" do
    subject { delete expense_path(expense) }

    let!(:expense) { create(:expense, user: current_user) }

    context 'correct params are passed' do
      it 'has successful status' do
        subject
        expect(response.status).to eq(302)
      end

      it 'has successful redirect' do
        subject
        expect(response.body).to redirect_to(root_path)
      end

      it 'delete object from db' do
        expect{subject}.to change(Expense, :count).by(-1)
      end
    end
  end
end
