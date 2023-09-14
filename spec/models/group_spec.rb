require 'rails_helper'
require 'faker'
require 'spec_helper'

RSpec.describe Group, type: :model do
  subject do
    @fake_user = User.create!(name: Faker::Name.unique.name,
                              email: Faker::Internet.email,
                              password: '123456', password_confirmation: '123456')

    Group.new(name: 'Shopping',
              icon: 'fa-bag-shopping',
              user: @fake_user)
  end

  before { subject.save }

  describe 'associations' do
    it 'should have correct associations' do
      expect(Group.reflect_on_association(:expense_groups).macro).to eq(:has_many)
      expect(Group.reflect_on_association(:expenses).macro).to eq(:has_many)
      expect(Group.reflect_on_association(:user).macro).to eq(:belongs_to)
    end
  end

  describe 'validations' do
    it 'should have a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it {
      should validate_uniqueness_of(:name).case_insensitive.scoped_to(:user_id).with_message('Category already exist')
    }
  end
end
