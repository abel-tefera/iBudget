class CreateExpenseGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :expense_groups do |t|

      t.timestamps
    end
  end
end
