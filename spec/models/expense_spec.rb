require 'rails_helper'
require 'faker'
require 'spec_helper'

RSpec.describe Expense, type: :model do
  subject do
    @fake_user = User.create!(name: Faker::Name.unique.name,
                              email: Faker::Internet.email,
                              password: '123456', password_confirmation: '123456')

    Expense.new(name: 'Gucci Bag',
                icon: 'fa-bag-shopping',
                amount: 3500,
                author_id: @fake_user.id)
  end

  before { subject.save }

  describe 'associations' do
    it 'should have correct associations' do
      expect(Expense.reflect_on_association(:expense_groups).macro).to eq(:has_many)
      expect(Expense.reflect_on_association(:groups).macro).to eq(:has_many)
      expect(Expense.reflect_on_association(:author).macro).to eq(:belongs_to)
    end
  end

  describe 'validations' do
    it 'should have a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should have an amount present' do
      subject.amount = nil
      expect(subject).to_not be_valid
    end

    it 'should have an amount greater than 0' do
      subject.amount = -1
      expect(subject).to_not be_valid
    end

    it {
      should validate_uniqueness_of(:name)
        .case_insensitive.scoped_to(:author_id)
        .with_message('Transaction already made')
    }
  end
end
