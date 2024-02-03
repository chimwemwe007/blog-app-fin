class User < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :likes, foreign_key: 'author_id', dependent: :destroy
  has_many :posts, foreign_key: :author_id, dependent: :destroy

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true

  def recent_posts(limit = 3)
    posts.order(created_at: :desc).limit(limit)
  end

  def update_posts_counter
    update(posts_counter: posts.count)
    reload
    Rails.logger.info("Posts counter updated to: #{posts_counter}")
  end
end
