class SubmissionTest < ApplicationRecord
  belongs_to :submission
  belongs_to :test
  enum process_state: [:processed, :unprocessed, :processing]
end
