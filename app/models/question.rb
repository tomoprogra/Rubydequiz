class Question < ApplicationRecord
  has_many :options
  
  def next
    Question.where("id > ?", id).order("id ASC").first
  end
end
