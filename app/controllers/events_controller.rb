class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search]
      @events = Event.by_tag(params[:search])
    else
      @events = Event.all
    end
  end

  def show
  end

  def new
    @event = Event.new
    @calendars = Calendar.all
    @tags = Tag.all
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    @event.save
    respond_to do |format|
      if @event.save
        format.html { redirect_to '/', notice: 'Event was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to user_calendar_path(current_user, current_user.calendars.me) }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    if @event.user == current_user
      @event.destroy
      redirect_to user_calendar_path(current_user, current_user.calendars.me),
                  notice: 'Event was successfully destroyed.' 
    else
      redirect_to user_calendar_path(current_user, current_user.calendars.me),
                  notice: 'You cannot delete an event you did not create'
    end
  end

  private

    def set_event
      @event = Event.find_by_id(params[:id])
      if @event.nil?
          def @event.message
            "Not Found"
          end
      end
    end


    def event_params
      params.require(:event).permit(:name, :date, :description, :image, :location, :calendar_id, :all_tags)
    end
end
