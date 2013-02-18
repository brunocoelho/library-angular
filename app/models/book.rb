class Book < ActiveRecord::Base
  belongs_to :user
  has_many :authors

  validates_presence_of :isbn, :title, :edition, :pages
  validates_numericality_of :pages
  validates_uniqueness_of :isbn

  attr_accessible :edition, :isbn, :lending_date, :pages, :title, :user_id
end
