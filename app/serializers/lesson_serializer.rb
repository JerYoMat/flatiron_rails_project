class LessonSerializer < ActiveModel::Serializer
  attributes :id, :name, :content
  has_many :tips 
end
