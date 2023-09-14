require 'rails_helper'
require 'faker'

RSpec.describe 'Groups', type: :request do
  before(:each) do
    @fake_user = User.create!(name: Faker::Name.unique.name,
                              email: Faker::Internet.email,
                              password: '123456', password_confirmation: '123456')

    Group.create(name: 'Shopping',
                 icon: 'fa-bag-shopping',
                 user: @fake_user)
    sign_in @fake_user
  end

  describe 'GET /index' do
    it 'returns http success' do
      get '/groups'
      expect(response).to have_http_status(:success)
    end
    it 'should render the group index action correctly' do
      get '/groups'
      expect(response).to be_successful
      expect(response.body).to include('Shopping')
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/groups/new'
      expect(response).to have_http_status(:success)
    end

    it 'should allow users to create categories' do
      get '/groups'
      expect(response).to be_successful
      expect(response.body).to include('Add a Category')
    end
  end
end
