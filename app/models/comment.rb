class Comment < ApplicationRecord
  belongs_to :post

  validates :body, presence: true
  validate :cannot_comment_on_closed_post

  private

  def cannot_comment_on_closed_post
    return if post.nil? || post.published?

    errors.add(:base, "Your comment cannot be added to this article.")
  end
end
