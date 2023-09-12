class AddTotalToGroup < ActiveRecord::Migration[7.0]
  def change
    add_column :groups, :total_expense, :float, :default => 0
  end
end
