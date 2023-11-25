class ActivityChannel < ApplicationCable::Channel
  def subscribed
    activity = Activity.find(params[:id])
    stream_for activity
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
