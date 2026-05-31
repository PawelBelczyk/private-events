class EventAttendancesController < ApplicationController
 before_action :authenticate_user!
 
  def create
    event = Event.find(params[:event_id])
    current_user.event_attendances.create(
      attended_event: event
    )
    redirect_to event
  end
end
