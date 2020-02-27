class PostsController < ApplicationController
  before_action :set_post!, only: [:show, :edit, :update]

  def show
  end

  def edit
    @post = Post.find_by_id(params[:id])
  end

  def update
    @post = Post.find_by_id(params[:id])
# byebug
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      # byebug
      render :edit
    end
  end

  private

  def post_params
    params.permit(:category, :content, :title)
  end

  def set_post!
    @post = Post.find(params[:id])
  end
end
