require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validate' do 
    it 'should create a user with all filed inputed and password matches'  do 
      @user = User.new(first_name: 'bob', last_name: 'hastings', email: 'bob@example.com', password: '123', password_confirmation: '123')
      @user.validate
      expect(@user.errors.full_messages).to be_empty
    end
    
    it 'should not create a user with different passwords'  do 
      @user = User.new(first_name: 'bob', last_name: 'hastings', email: 'bob@example.com', password: '123', password_confirmation: '1234')
      @user.save
      expect(User.find_by(email: 'bob@example.com').to_a).to be_empty
    end
    
    it 'should fail to create a user if the email already exist'  do 
      @user1 = User.new(first_name: 'bob', last_name: 'hastings', email: 'bob@example.com', password: '123', password_confirmation: '123')
      @user1.save
      @user2 = User.new(first_name: 'bob', last_name: 'hastings', email: 'BOB@EXAMPLE.COM', password: '123', password_confirmation: '123')
      @user2.save
      expect(User.find_by(email: 'BOB@EXAMPLE.COM')).to be_nil
    end
    
    it 'should not create a user with no first name'  do 
      @user = User.new(first_name: nil, last_name: 'hastings1', email: 'bob@example.com', password: '123', password_confirmation: '1234')
      @user.save
      expect(@user.errors.full_messages).not_to be_empty
    end
    it 'should not create a user with no last_name'  do 
      @user = User.new(first_name: 'bob1', last_name: nil, email: 'bob@example.com', password: '123', password_confirmation: '1234')
      @user.save
      expect(@user.errors.full_messages).not_to be_empty
    end
    
  end
end
