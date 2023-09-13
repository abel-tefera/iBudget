class Expense < ApplicationRecord
  has_many :expense_groups, dependent: :destroy
  has_many :groups, through: :expense_groups, dependent: :destroy
  belongs_to :author, class_name: 'User'

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }

  ICONS = {
    'fa-credit-card' => 'Credit Card',
    'fa-gift' => 'Gift',
    'fa-gamepad' => 'Entertainment',
    'fa-bag-shopping' => 'Shopping Bag',
    'fa-basket-shopping' => 'Shopping Basket',
    'fa-cart-shopping' => 'Shopping Cart'
  }.freeze
end
