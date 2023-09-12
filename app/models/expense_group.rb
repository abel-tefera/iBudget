class ExpenseGroup < ApplicationRecord
  belongs_to :group
  belongs_to :expense

  after_save :update_group_total_expense

  private

  def update_group_total_expense
    group.total_expense = group.total_expense + expense.amount
    group.save
  end
end
