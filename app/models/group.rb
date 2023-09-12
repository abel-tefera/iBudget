class Group < ApplicationRecord
  has_many :expense_groups, dependent: :destroy
  has_many :expenses, through: :expense_groups, dependent: :destroy
  belongs_to :user

  validates :name, presence: true
  validates_uniqueness_of :name, scope: :user_id, message: 'Category already exist'
end
