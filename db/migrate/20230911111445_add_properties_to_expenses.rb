class AddPropertiesToExpenses < ActiveRecord::Migration[7.0]
  def change
    add_column :expenses, :name, :string
    add_column :expenses, :amount, :float
    add_reference :expenses, :author, foreign_key: { to_table: :users, name: :author_id }
  end
end
