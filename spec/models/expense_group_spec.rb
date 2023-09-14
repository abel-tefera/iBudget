require 'rails_helper'

RSpec.describe ExpenseGroup, type: :model do
  describe 'associations' do
    it 'should have correct associations' do
      expect(ExpenseGroup.reflect_on_association(:group).macro).to eq(:belongs_to)
      expect(ExpenseGroup.reflect_on_association(:expense).macro).to eq(:belongs_to)
    end
  end
end