class BooksController < ApplicationController
  respond_to :html, :json

  API_BASE = 'https://www.googleapis.com/books/v1/volumes'

  def index
    query = params[:q]
    startIndex = params[:startIndex] || 0

    params = "?q=#{query}&country=US&maxResults=40&startIndex=#{startIndex}"

    @books = HTTParty.get(API_BASE + params)
    respond_with @books
  end

  def show
    @book = HTTParty.get(API_BASE + "/#{params[:id]}?country=US")

    respond_with @book
  end
end
