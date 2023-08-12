require 'rails_helper'

RSpec.describe 'recipes/index.html.erb', type: :view do
  describe 'integration tests for recipes page' do
    before(:each) do
      @user = User.create(name: 'cisco', email: 'cisco@gmail.com', password: '123456')
      # Assuming you have set up Devise test helpers or similar, you can use sign_in to simulate user authentication.
      sign_in @user

      @recipe1 = Recipe.create(name: 'cookies', user_id: @user.id, preparation_time_minutes: 34, cooking_time_minutes: 45,
                               description: 'test recipe 1', public: true)
      @recipe2 = Recipe.create(name: 'cake', user_id: @user.id, preparation_time_minutes: 34, cooking_time_minutes: 45,
                               description: 'test recipe 2', public: true)
      @recipe3 = Recipe.create(name: 'broth', user_id: @user.id, preparation_time_minutes: 34, cooking_time_minutes: 45,
                               description: 'test recipe 3', public: true)

      # Stub the view's current_user method to return the @user variable
      allow(view).to receive(:current_user).and_return(@user)

      # Stub the view's user_signed_in? method to return true
      allow(view).to receive(:user_signed_in?).and_return(true)

      # Assign the @recipes instance variable with the test data
      assign(:recipes, [@recipe1, @recipe2, @recipe3])

      # Render the view
      render
    end

    scenario 'check if recipes are available' do
      expect(rendered).to have_content 'cookies'
      expect(rendered).to have_content 'cake'
      expect(rendered).to have_content 'broth'
    end
  end
end
