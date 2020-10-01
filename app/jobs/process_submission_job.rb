class ProcessSubmissionJob < ApplicationJob
  include CableReady::Broadcaster
  queue_as :default

  def perform(test)
    test.update process_state: :processing

    morph_submission_test(test)

    sleep rand(2..6)

    test.update process_state: :processed

    morph_submission_test(test)
    morph_submission(test.submission)
  end

  def morph_submission_test(test)
    html = ApplicationController.render(
      partial: 'submissions/test_line',
      locals: { test: test }
    )

    cable_ready["process-submission-stream"].morph(
      selector: "#submission_test_#{test.id}",
      html: html
    )

    cable_ready.broadcast
  end

  def morph_submission(submission)
    html = ApplicationController.render(
      partial: 'submissions/tests_line',
      locals: { submission: submission }
    )

    cable_ready["process-submission-stream"].morph(
      selector: "#submission_#{submission.id}",
      html: html
    )

    cable_ready.broadcast
  end
end
