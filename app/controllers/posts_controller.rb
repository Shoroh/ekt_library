class PostsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
  before_action :load_user, :load_book, only: :create
  after_action :update_book, only: :create

  def index
    @posts = Post.all
    render json: @posts
  end

  def create
    @post = Post.new(post_params)
    @post.user = @user
    @post.book = @book

    if @post.save
      render json: @post, status: :created
    else
      render json: { errors: @post.errors }, status: :unprocessable_entity
    end
  end

  private

  def load_user
    # @user = User.find(params[:user_id])
    @user = current_user
  end

  def load_book
    @book = Book.find(params[:book_id])
  end

  def update_book
    @book.update(status: params[:title], user_id: current_user.id)

  end

  def post_params
    params.permit(:title, :end_date, :active)
  end
end
