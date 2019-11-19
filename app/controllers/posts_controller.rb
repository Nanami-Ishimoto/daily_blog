class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    @comment = @post.comments.build
    @comments = @post.comments.all
  end

  def update
    @post = Post.find(params[:id])
    @comment = @post.comments.build(comment_params)
    if @comment.save
      redirect_to post_path(@post)
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content, :post_id)
    end
end
