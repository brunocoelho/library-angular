class BooksController < ApplicationController
  respond_to :html, :json

  API_BASE = 'https://www.googleapis.com/books/v1/volumes'

  def index
    @books = HTTParty.get(API_BASE + "?q=quilting&country=US")
    respond_with @books
  end

  def show
    @book = HTTParty.get(API_BASE + "/#{params[:id]}?country=US")

    if @book.nil?
      redirect_to root_path
    else
      respond_with @book
    end
  end
end
