class AddPropertiesToExpenseGroups < ActiveRecord::Migration[7.0]
  def change
    add_reference :expense_groups, :group, null: false, foreign_key: true
    add_reference :expense_groups, :expense, null: false, foreign_key: true
  end
end
