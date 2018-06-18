class User < ActiveRecord::Base
    # becrypt method, you need password_digest column in database, you need password_confirmation
    has_secure_password

    has_many :reviews

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: { case_sensitive: false }
    validates :password, presence: true, length: { minimum: 6 }
    validates :password_confirmation, presence: true

    private

    def self.authenticate_with_credentials(email, password)
      email = email.strip
      user = User.where('lower(email) = ?', email.downcase).first
      # user.authenticate to verify the password is right using bcrypt method
      if user && user.authenticate(password)
        @user = user
      else
        nil
      end
    end

end
