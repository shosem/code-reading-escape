class Post < ApplicationRecord
  has_many :comments

  # NOTE: used by the "digest" action. Read carefully!
  def display_title
    titel.upcase
  end
end
