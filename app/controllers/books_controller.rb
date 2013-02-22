class BooksController < ApplicationController
  respond_to :html, :json
  before_filter :find_book, except: [:index, :create, :dashboard]

  def index
    @books = Book.order('created_at ASC')
    respond_with @books
  end

  def show
    respond_with @book
  end

  def create
    @book = Book.create(params[:book])
    created = @book ? 'true' : 'false'
    render json: { created: created }
  end

  def edit
    respond_with @book
  end

  def update
    @book.update_attributes(params[:book])
    respond_with @book
  end

  def destroy
    @book.destroy
    render json: { deleted: 'true' }
  end

  private
  def find_book
    @book = Book.find(params[:id])
  end
end
