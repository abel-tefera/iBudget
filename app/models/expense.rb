class Expense < ApplicationRecord
  has_many :expense_groups, dependent: :destroy
  has_many :groups, through: :expense_groups, dependent: :destroy
  belongs_to :author, class_name: 'User'

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates_uniqueness_of :name, case_sensitive: false, scope: :author_id, message: 'Transaction already made'

  ICONS = {
    'fa-credit-card' => 'Credit Card',
    'fa-gift' => 'Gift',
    'fa-gamepad' => 'Entertainment',
    'fa-bag-shopping' => 'Shopping Bag',
    'fa-basket-shopping' => 'Shopping Basket',
    'fa-cart-shopping' => 'Shopping Cart'
  }.freeze
end
