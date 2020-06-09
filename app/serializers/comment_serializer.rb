class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :created_at, :updated_at, :article_id
end
