class AddPropertiesToGroups < ActiveRecord::Migration[7.0]
  def change
    add_column :groups, :name, :string
    add_column :groups, :icon, :string
    add_reference :groups, :user, null: false, foreign_key: true
  end
end
