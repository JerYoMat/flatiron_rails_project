class User < ApplicationRecord

validates :name, presence: true, length: {maximum:50} 
before_save { email.downcase! }
EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates :email, presence: true, length: { maximum: 255 },
                    format: { with: EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
has_secure_password
validates :password, presence: true, length: { minimum: 6 }

def create 
  end 

  def edit
  end 

  def show 
  end 

  def update 
  end 

  def delete
  end 



end
