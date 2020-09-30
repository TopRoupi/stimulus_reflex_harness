class ProcessSubmissionJob < ApplicationJob
  include CableReady::Broadcaster
  queue_as :default

  def perform(submission, test)
    sleep rand(5)
    submission.submission_tests << SubmissionTest.create(submission: submission, test: test)

    html = ApplicationController.render(
      partial: 'submissions/tests_line',
      locals: { submission: submission }
    )

    cable_ready["process-submission-stream"].morph(
      selector: "#submission_#{submission.id}",
      html: html
    )

    cable_ready.broadcast

    submission.save!
  end
end
