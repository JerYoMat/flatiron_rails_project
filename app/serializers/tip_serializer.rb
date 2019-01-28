class TipSerializer < ActiveModel::Serializer
  attributes :id, :title, :link, :description, :user_id 
  belongs_to :lesson 
end
