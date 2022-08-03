class ExpensesController < ApplicationController
  before_action :set_expense

  def index
    @current_user_expenses = Expense.all.accessible_for(current_user)
    @expenses = @current_user_expenses.order(sort_col + '' + sort_dir)
  end

  def show
  end

  def new
    @expense = Expense.new
  end

  def edit
  end

  def create
    @expense = Expense.new(expense_params)
    redirect_to expense_path(expense)
  end

  def destroy
    @expense.destroy

  end

  private

  def set_expense
    @expense = Expense.find(params[:id])
  end

  def expense_params
    params[:expense].permit(:title, :description, :category, :user_id, :created_at)
  end

  def sort_col
    params[:sort] || 'created_at'
  end

  def sort_dir
    params[:direction] || 'desc'
  end
end
