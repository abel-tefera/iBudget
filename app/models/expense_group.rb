class ExpenseGroup < ApplicationRecord
  belongs_to :group
  belongs_to :expense

  after_save :increment_group_total_expense
  after_destroy :decrement_group_total_expense

  private

  def increment_group_total_expense
    group.total_expense = group.total_expense + expense.amount
    group.save
  end

  def decrement_group_total_expense
    group.total_expense = group.total_expense - expense.amount
    group.save
  end
end
