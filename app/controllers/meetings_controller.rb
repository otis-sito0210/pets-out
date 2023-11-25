class MeetingsController < ApplicationController
  def create
    @activity = Activity.find(params[:activity_id])
    @meeting = Meeting.new(meeting_params)
    @meeting.activity = @activity
    @meeting.user = current_user
    if @meeting.save
      ActivityChannel.broadcast_to(
      @activity,
    render_to_string(partial: "meeting", locals: {meeting: @meeting})
      )
      head :ok
    else
      render "activities/show", status: :unprocessable_entity
    end
  end

  private

  def meeting_params
    params.require(:meeting).permit(:content)
  end
end
