class Submission < ApplicationRecord
  belongs_to :exercice
  has_many :submission_tests, dependent: :destroy
  has_many :tests, through: :submission_tests

  before_create :set_submission_tests

  def set_submission_tests
    exercice.tests.each do |test|
      submission_tests << SubmissionTest.new(submission: self, test: test, process_state: :unprocessed)
    end
  end
end
