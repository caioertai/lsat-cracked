class QuizTemplateQuestion < ApplicationRecord
  belongs_to :question
  belongs_to :quiz_template

  validates :question, uniqueness: { scope: :quiz_template }
end
