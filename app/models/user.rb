class User < ApplicationRecord
    has_many :twitter_accounts
    has_many :tweets
    has_secure_password

    validates  :email, :name, :password, presence: true
    validates  :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Must be a valid format" }
end
 