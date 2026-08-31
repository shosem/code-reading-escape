class PostsController < ApplicationController
  def show
    @post = Post.find_by!(slug: params[:slug])
    @status_key = @post.published? ? "post.status.open" : "post.status.closed"
    @comment = Comment.new
  end

  def digest
    @post = Post.find_by!(slug: params[:slug])
    @formatted = @post.display_title
  end
end
