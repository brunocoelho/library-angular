class ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  protect_from_forgery

  # def after_sign_in_path_for(resource)
  #   books_path
  # end
end
