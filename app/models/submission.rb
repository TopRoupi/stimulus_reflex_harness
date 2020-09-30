class Submission < ApplicationRecord
  belongs_to :exercice
  has_many :submission_tests, dependent: :destroy
end
