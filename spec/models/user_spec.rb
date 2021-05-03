require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validate' do 
    it 'should create a user with all filed inputed and password matches'  do 
      @user = User.new(first_name: 'bob', last_name: 'hastings', email: 'bob@example.com', password: '123', password_confirmation: '123')
      @user.validate
      expect(@user.errors.full_messages).to be_empty
    end

    it 'should create a user with all filed inputed'  do 
      @user = User.new(first_name: 'bob', last_name: 'hastings', email: 'bob@example.com', password: '123', password_confirmation: '1234')
      @user.validate
      expect(@user.errors.full_messages).to be_empty
    end
  end
end
