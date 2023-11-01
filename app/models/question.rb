class Question < ApplicationRecord
  has_many :options, dependent: :destroy
  validates :content, presence: true
  accepts_nested_attributes_for :options
  scope :first_question, -> { order(:id).first }
  def next
    Question.where("id > ?", id).order(:id).first
  end
end
