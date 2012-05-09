class Book < ActiveRecord::Base
  has_many :comments
  has_many :points
  has_many :book_marks
end
