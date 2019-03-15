class Api::PostsController < ApplicationController

  # GET /api/posts
  def index
    render json: {
      data: Post.all
    }, status: :ok
  end

  # GET /api/posts/:id
  def show
    if Post.exists? params[:id]
      render json: {
        data: Post.find(params[:id]),
        message: 'Post found.'
      }, status: :ok
    else
      render json: {
        message: 'Post not found at requested id.'
      }, status: :not_found
    end
  end

  # POST /api/posts
  def create
    post = Post.create(new_post_params)
    if post.save
      render json: {
        message: 'Post created successfully!',
      }, status: :ok
    else
      render json: {
        message: 'Unable to create new post.'
      }, status: :unprocessable_entity
    end
  end

  # PUT/PATCH /api/posts/:id
  def update
    if Post.exists? params[:id]
      post = Post.find(params[:id])
      if post.update(post_params)
        render json: {
          message: 'Post updated successfully!'
        }, status: :ok
      else
        render json: {
          message: 'Post unable to update.'
        }, status: :unprocessable_entity
      end
    else
      render json: {
        message: 'Post not found at requested id.'
      }, status: :not_found
    end
  end

 # DESTROY /api/posts/:id
  def destroy
    if Post.exists? params[:id]
      post = Post.find(params[:id])
      post.destroy
      if post.destroyed?
        render json: {
          message: 'Post successfully deleted.'
        }, status: :ok
      else
        render json: {
          message: 'Error occured when attempting to delete post. Post has not been deleted.'
        }, status: :unprocessable_entity
      end
    else
      render json: {
        message: 'Post not found at requested id.'
      }, status: :not_found
    end
  end

  private
  def post_params
    params.permit(:id, :title, :body)
  end

  def new_post_params
    params.permit(:title, :body)
  end
end
