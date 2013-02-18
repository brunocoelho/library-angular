class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :books

  validates_presence_of :email, :name

  attr_accessible :email, :name, :password, :password_confirmation
end
