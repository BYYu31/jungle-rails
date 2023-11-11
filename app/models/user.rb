class User < ApplicationRecord
  has_secure_password

  validates :password, presence: true, length: { minimum: 6 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  def self.authenticate_with_credentials(email, password)
    email.strip!
    email.downcase!    
    user = User.find_by_email(email)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end
end
