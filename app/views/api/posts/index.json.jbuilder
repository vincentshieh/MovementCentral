json.array! @posts do |post|
  json.(post, :id, :author_id, :recipient_id, :content, :created_at, :updated_at)
  json.comments post.comments
end
