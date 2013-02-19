class AuthorsController < ApplicationController
  respond_to :json

  def index
    @authors = Author.all
    respond_with @authors
  end
end
