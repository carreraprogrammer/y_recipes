require 'rails_helper'

RSpec.describe 'foods/index.html.erb', type: :view do
  describe 'integration tests for foods page' do
    before(:each) do
      @user = User.create(name: 'cisco', email: 'cisco@gmail.com', password: '123456')
      # Assuming you have set up Devise test helpers or similar, you can use sign_in to simulate user authentication.
      sign_in @user

      # Create test foods associated with the user
      @food1 = Food.create(name: 'biscuits', user_id: @user.id, measurement_unit: 'grams', price: 10)
      @food2 = Food.create(name: 'mango', user_id: @user.id, measurement_unit: 'grams', price: 15)
      @food3 = Food.create(name: 'cheese', user_id: @user.id, measurement_unit: 'grams', price: 20)

      # Stub the controller action to assign the @foods instance variable with the test foods data
      assign(:foods, [@food1, @food2, @food3])

      # Render the view
      render
    end

    it 'displays foods on the foods page' do
      expect(rendered).to have_content 'biscuits'
      expect(rendered).to have_content 'mango'
      expect(rendered).to have_content 'cheese'
    end
  end
end
