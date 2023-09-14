require 'rails_helper'
require 'faker'

RSpec.describe 'Expense index page', type: :feature do
  before(:example) do
    @fake_user = User.create!(name: Faker::Name.unique.name,
                              email: Faker::Internet.email,
                              password: '123456', password_confirmation: '123456')

    sign_in @fake_user
    @group = Group.create(name: 'Shopping', user_id: @fake_user.id)

    @expense = Expense.create(name: 'Gucci Bag',
                              icon: 'fa-bag-shopping',
                              amount: 3500,
                              author_id: @fake_user.id)

    ExpenseGroup.create(group_id: @group.id, expense_id: @expense.id)
    visit group_path(@group)
  end

  describe "page's content" do
    it "should see the 'ADD A TRANSACTION' button" do
      expect(page).to have_content('Add a Transaction')
    end

    it 'should see list of all transactions created by user' do
      @group.expenses.each do |expense|
        expect(page).to have_content expense.name
      end
    end

    it 'should see the amount of all transactions' do
      @group.expenses.each do |expense|
        expect(page).to have_content ActionController::Base.helpers.number_to_currency(expense.amount)
      end
    end
  end

  describe "clicking on 'ADD A TRANSACTION' button" do
    it 'redirects to expenses#new page' do
      click_link(href: new_group_expense_path(@group))
      expect(page).to have_current_path(new_group_expense_path(@group))
    end
  end

  describe 'clicking the back arrow' do
    it 'redirects to groups index' do
      click_link(href: groups_path)
      expect(page).to have_current_path(groups_path)
    end
  end
end
