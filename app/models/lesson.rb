class Lesson < ApplicationRecord
    has_many :tips
    has_many :users, through: :tips 
end
