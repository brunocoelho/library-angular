class Book < ActiveRecord::Base
  belongs_to :user
  has_many :authors

  validates_presence_of :isbn, :title, :edition, :pages, :image_url
  validates_numericality_of :pages
  validates_uniqueness_of :isbn

  attr_accessible :edition, :image_url, :isbn, :lending_date, :pages, :title, :user_id
end
