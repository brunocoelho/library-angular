class User < ActiveRecord::Base
  devise :database_authenticatable, :trackable, :validatable

  has_many :books

  validates_presence_of :email, :name

  attr_accessible :email, :is_admin, :name, :password, :password_confirmation
end
