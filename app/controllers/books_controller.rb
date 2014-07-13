class BooksController < ApplicationController
  respond_to :html, :json

  API_BASE = 'https://www.googleapis.com/books/v1/volumes'
  DEFAULT_COUNTRY = 'US'

  def index
    query = params[:q]
    startIndex = params[:startIndex] || 0

    options = {}
    options[:country] = DEFAULT_COUNTRY
    options[:maxResults] = 40
    options[:q] = query
    options[:startIndex] = startIndex

    @books = HTTParty.get(API_BASE, query: options)

    respond_with @books
  end

  def show
    @book = HTTParty.get(API_BASE + "/#{params[:id]}?country=#{DEFAULT_COUNTRY}")

    respond_with @book
  end
end
