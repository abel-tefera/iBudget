class Group < ApplicationRecord
  has_many :expense_groups, dependent: :destroy
  has_many :expenses, through: :expense_groups, dependent: :destroy
  belongs_to :user

  validates :name, presence: true
  validates_uniqueness_of :name, case_sensitive: false, scope: :user_id, message: 'Category already exist'

  ICONS = {
    'fa-credit-card' => 'Credit Card',
    'fa-gift' => 'Gift',
    'fa-gamepad' => 'Entertainment',
    'fa-bag-shopping' => 'Shopping Bag',
    'fa-basket-shopping' => 'Shopping Basket',
    'fa-cart-shopping' => 'Shopping Cart'
  }.freeze
end
