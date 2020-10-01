class AddProcessStateToSubmissionTests < ActiveRecord::Migration[6.0]
  def change
    add_column :submission_tests, :process_state, :integer
  end
end
