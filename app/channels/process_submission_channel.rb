class ProcessSubmissionChannel < ApplicationCable::Channel
  def subscribed
    stream_from "process-submission-stream"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
