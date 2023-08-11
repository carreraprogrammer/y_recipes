require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before(:each) do
    @user = User.create(name: 'cisco', email: 'cisco@gmail.com', password: '123456')
    @recipe = Recipe.new(
      name: 'cookies',
      preparation_time_minutes: 10,
      cooking_time_minutes: 3,
      description: 'cookies, a snack loved by all, served in delicious circles',
      public: true,
      user_id: @user.id
    )
  end

  describe 'Initialize' do
    it 'should create a new recipe' do
      expect(@recipe).to be_a(Recipe)
    end

    it 'should have the attributes' do
      expect(@recipe).to have_attributes(
        name: 'cookies',
        preparation_time_minutes: 10,
        cooking_time_minutes: 3,
        description: 'cookies, a snack loved by all, served in delicious circles',
        public: true,
        user_id: @user.id
      )
    end
  end

  describe 'Validations' do
    before(:each) do
      expect(@recipe).to be_valid
    end

    it 'should validate presence of name' do
      @recipe.name = 'a'
      expect(@recipe).to_not be_valid
      @recipe.name = nil
      expect(@recipe).to_not be_valid
    end

    it 'should validate length of name' do
      @recipe.name = 'a' * 51
      expect(@recipe).to_not be_valid
    end

    it 'should validate presence of description' do
      @recipe.description = nil
      expect(@recipe).to_not be_valid
    end

    it 'should validate length of description' do
      @recipe.description = 'a' * 9
      expect(@recipe).to_not be_valid
    end

    it 'should validate presence of preparation_time_minutes' do
      @recipe.preparation_time_minutes = nil
      expect(@recipe).to_not be_valid
    end

    it 'should validate presence of cooking_time_minutes' do
      @recipe.cooking_time_minutes = nil
      expect(@recipe).to_not be_valid
    end

    it 'should validate presence of public' do
      @recipe.public = nil
      expect(@recipe).to_not be_valid
    end

    it 'should validate inclusion of public' do
      @recipe.public = false
      expect(@recipe).to be_valid
    end
  end
end
