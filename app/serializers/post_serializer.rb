class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :topics, :created_at, :updated_at
  has_one :user
end
