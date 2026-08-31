class CommentsController < ApplicationController
  def create
    @post = Post.find_by!(slug: params[:post_slug])
    @comment = @post.comments.new(comment_params)
    @status_key = @post.published? ? "post.status.open" : "post.status.closed"

    if @comment.save
      redirect_to post_path(@post.slug), notice: "コメントを投稿しました!"
    else
      render "posts/show", status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :body)
  end
end
