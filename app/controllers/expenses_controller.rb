class ExpensesController < ApplicationController
  before_action :set_expense, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction

  def index
    @current_user_expenses = Expense.all.accessible_for(current_user)
    @expenses = @current_user_expenses.order(sort_column + ' ' + sort_direction)
    render_xhr
  end

  def show
  end

  def new
    @expense = Expense.new
  end

  def edit
  end

  def create
    @expense = Expense.create(expense_params)
    redirect_to expense_path(@expense)
  end

  def update
    @expense.update(expense_params)
    redirect_to expense_path(@expense)
  end

  def destroy
    @expense.destroy
    redirect_to root_path
  end

  private

  def set_expense
    @expense = Expense.find(params[:id])
  end

  def expense_params
    params[:expense].permit(:title, :description, :category, :user_id, :amount, :created_at)
  end

  def sort_column
    params[:sort] || 'created_at'
  end

  def sort_direction
    params[:direction] || 'desc'
  end

  def render_xhr
    render layout: false if request.xhr?
  end
end
