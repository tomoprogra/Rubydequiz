class Question < ApplicationRecord
  has_many :options
  scope :first_question, -> { order(:id).first }
  def next
    Question.where("id > ?", self.id).order(id: :asc).first
  end
end
