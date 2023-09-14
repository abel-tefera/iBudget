require 'rails_helper'
require 'faker'

RSpec.describe 'Expenses', type: :request do
  before(:each) do
    @fake_user = User.create!(name: Faker::Name.unique.name,
                              email: Faker::Internet.email,
                              password: '123456', password_confirmation: '123456')

    @group = Group.create(name: 'Shopping',
                          icon: 'fa-bag-shopping',
                          user: @fake_user)

    @expense = Expense.create(name: 'Gucci Bag',
                              icon: 'fa-bag-shopping',
                              amount: 3500,
                              author_id: @fake_user.id)

    ExpenseGroup.create(group_id: @group.id, expense_id: @expense.id)

    sign_in @fake_user
  end

  describe 'GET /new' do
    it 'returns http success' do
      get "/groups/#{@group.id}/expenses/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get "/groups/#{@group.id}/"
      expect(response).to have_http_status(:success)
    end
    it 'should have the expense in the group show page' do
      get "/groups/#{@group.id}/"
      expect(response).to be_successful
      expect(response.body).to include('Gucci Bag')
    end
  end
end
