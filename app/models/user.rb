class User < ActiveRecord::Base
  has_secure_password

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :first_name, :last_name, :password, presence:true
  validates :password, length: { minimum: 3 }

  def self.authenticate_with_credentials(email, password)  
    # find the user and proceed to authenticate
    user = User.find_by_email(email.strip.downcase)
    if user && user.authenticate(password)
      return user
    end

  end
end
