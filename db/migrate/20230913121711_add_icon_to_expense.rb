class AddIconToExpense < ActiveRecord::Migration[7.0]
  def change
    add_column :expenses, :icon, :string
  end
end
