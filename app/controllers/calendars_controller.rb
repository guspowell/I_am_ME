class CalendarsController < ApplicationController
  before_action :set_calendar, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


  def index
    @calendar = current_user.calendars.me
    redirect_to user_calendar_path current_user, @calendar
  end

  def show
    @event = Event.new
    @week = CalendarWeek.new Integer(params[:wkid] || 0)
    @events = @calendar.events.all.select {|event|  event.date.between?(@week.day, @week.sunday+1) }
  end

  def new
    @calendar = Calendar.new
  end



  def edit
  end

  def mebutton
    @event = Event.find(params[:event_id])
    current_user.calendars.where(:name=>'Me').sample.events << @event
    redirect_to "/"
  end


  def create
    @calendar = Calendar.new(:name => params[:name])
    @calendar.user_id = current_user
    respond_to do |format|
      if @calendar.save
        current_user.calendars << @calendar
        format.html { redirect_to user_calendar_path(current_user, @calendar.id), notice: 'Calendar was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end


  def update
    respond_to do |format|
      if @calendar.update(calendar_params)
        format.html { redirect_to @calendar, notice: 'Calendar was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end


  def destroy
    @calendar.destroy
    respond_to do |format|
      format.html { redirect_to calendars_url, notice: 'Calendar was successfully destroyed.' }
    end
  end

  private

    def set_calendar
      @calendar = Calendar.find(params[:id])
    end


    def calendar_params
      params.require(:calendar).permit(:user_id, :name)
    end
end
