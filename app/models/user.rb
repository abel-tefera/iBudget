class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :expenses, foreign_key: :author_id, dependent: :destroy
  has_many :groups, dependent: :destroy

  validates :name, presence: true

  after_commit :send_welcome_email, on: :create

  enum role: %i[user student staff teacher admin]

  after_initialize :set_default_role, if: :new_record?

  private

  def send_welcome_email
    UserMailer.with(user: self).welcome_email.deliver_later
  end

  def set_default_role
    self.role ||= :user
  end
end
