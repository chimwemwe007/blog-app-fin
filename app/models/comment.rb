class Comment < ApplicationRecord
  belongs_to :post, class_name: 'Post', foreign_key: :post_id
  belongs_to :user, optional: true, class_name: 'User', foreign_key: :user_id

  def update_comments_counter
    post.update(comments_counter: post.comments.count)
  end
end
