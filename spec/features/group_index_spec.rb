require 'rails_helper'
require 'faker'

RSpec.describe 'Group index page', type: :feature do
  before(:example) do
    @fake_user = User.create!(name: Faker::Name.unique.name,
                              email: Faker::Internet.email,
                              password: '123456', password_confirmation: '123456')

    sign_in @fake_user
    @group = Group.create(name: 'Shopping', user_id: @fake_user.id)
    Group.create(name: 'Groceries', user_id: @fake_user.id)
    visit root_path
  end

  describe "page's content" do
    it "should see the 'ADD A CATEGORY' button" do
      expect(page).to have_content('Add a Category')
    end

    it "should see the 'Log Out' button" do
      expect(page).to have_content('Log Out')
    end

    it 'should see names of all groups created by user' do
      @fake_user.groups.each do |group|
        expect(page).to have_content group.name
      end
    end
  end

  describe "clicking on 'ADD A CATEGORY' button" do
    it 'redirects to groups#new page' do
      click_link(href: new_group_path)
      expect(page).to have_current_path(new_group_path)
    end
  end

  describe 'clicking on a category item' do
    it 'redirects to groups#show page' do
      click_link(href: group_path(@group))
      expect(page).to have_current_path(group_path(@group))
    end
  end
end
