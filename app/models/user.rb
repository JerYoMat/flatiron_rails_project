class User < ApplicationRecord
  has_many :tips, dependent: :destroy  #dependent destroy makes sure that tips are deleted if user is deleted
  has_many :lessons, through: :tips 
  attr_accessor :remember_token #needed in case user checks remember me 

validates :name, presence: true, length: {maximum:50} 
before_save { self.email = email.downcase }
EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates :email, presence: true, length: { maximum: 255 },
                    format: { with: EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

                    has_secure_password
validates :password, presence: true, length: { minimum: 6 },  allow_nil: true #the nil is there so when a user updates their profile they do not have to enter their password again.  New users are still required to provide a password with at least six characters. 

def self.digest(string)
  cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                BCrypt::Engine.cost
  BCrypt::Password.create(string, cost: cost)
end

# Returns a random token with very low probability of duplication
def self.new_token
  SecureRandom.urlsafe_base64
end

def remember
  self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
end


#Note that the remember_token argument in the authenticated? method is not the same as the attr_accessor defined up top.  
def authenticated?(remember_token)
  return false if remember_digest.nil?  
  BCrypt::Password.new(remember_digest).is_password?(remember_token)
end

def forget
  update_attribute(:remember_digest, nil)
end

def feed  
  Tip.where("user_id = ?", id) #Using ? makes sure that the id is escaped to guard against SQL Injection 
end 

end

#Steps for remember me feature
#1Create a random string of digits for use as a remember token.
#2Place the token in the browser cookies with an expiration date far in the future.
#3Save the hash digest of the token to the database.
#4Place an encrypted version of the user’s id in the browser cookies.
#5When presented with a cookie containing a persistent user id, find the user in the database using the given id, and verify that the remember token cookie matches the associated hash digest from the database.