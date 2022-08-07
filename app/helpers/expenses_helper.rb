module ExpensesHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    direction = column == sort_column && sort_direction == 'asc' ? 'desc' : 'asc'
    link_to title, { sort: column,
                     direction: direction}, { remote: true }
  end

  def count_month_spend
    CurrentMonthQuery.new(@current_user_expenses).call.sum(:amount)
  end

  def count_showed_spend
    @expenses.reduce(0) { | sum, expense | sum + expense.amount }
  end

  def count_year_spend
    ExpensesAYearQuery.new(@current_user_expenses).call.sum(:amount)
  end
end