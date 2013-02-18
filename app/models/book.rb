class Book < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :isbn, :title
  validates_numericality_of :user_id

  attr_accessible :isbn, :lending_date, :title, :user_id
end
