class User < ActiveRecord::Base
  has_secure_password

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :first_name, :last_name, :password, :password_confirmation, presence:true
  validates :password, length: { minimum: 3 }
  validate :password_cannot_be_different_from_confirmation

  def password_cannot_be_different_from_confirmation
    if password != password_confirmation
      errors.add(:password, "passwords need to match")
    end
  end
end
