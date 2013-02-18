class Author < ActiveRecord::Base
  belongs_to :book

  validates_presence_of :book_id, :name
  validates_numericality_of :book_id

  attr_accessible :book_id, :name
end
