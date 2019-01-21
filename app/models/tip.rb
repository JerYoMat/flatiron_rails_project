class Tip < ApplicationRecord
  belongs_to :user 
  belongs_to :lesson 
  default_scope -> { order(created_at: :desc) }  #stabby lambda
  validates :user_id, presence: true
  validates :lesson_id, presence: true
  validates :title, presence: true, length: {minimum: 5}
  validates :description, presence: true 
  #LINK_REGEX = /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$/ix
  validates :link, presence: true, length: { maximum: 255 }
  #,format: { with: LINK_REGEX }

end
