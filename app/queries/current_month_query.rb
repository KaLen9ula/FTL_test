class CurrentMonthQuery
  attr_reader :expenses

  def initialize(expenses)
    @expenses = expenses
  end

  def call
    filter_by_month
    @expenses
  end

  private

  def filter_by_month
    @expenses = expenses.where(created_at: Time.now.beginning_of_month..Time.now.end_of_month)
  end
end
