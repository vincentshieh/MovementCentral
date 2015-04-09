json.array! @posts do |post|
  json.(post, :id, :author_id, :content, :created_at, :picture, :recipient_id, :updated_at)
  json.comments post.comments
end
