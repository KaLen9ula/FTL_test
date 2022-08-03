class ExpensesAYearQuery
  attr_reader :expenses

  def initialize(expenses)
    @expenses = expenses
  end

  def call
    expenses_in_a_year
    @expenses
  end

  private

  def expenses_in_a_year
    @expenses = expenses.where('extract(year from created_at) = ?', Time.now.strftime("%Y").to_i)
  end
end
