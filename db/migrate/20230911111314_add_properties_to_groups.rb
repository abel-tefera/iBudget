class AddPropertiesToGroups < ActiveRecord::Migration[7.0]
  def change
    add_column :groups, :name, :string
    add_column :groups, :icon, :string
    add_reference :groups, :author, foreign_key: { to_table: :users, name: :author_id }
  end
end
