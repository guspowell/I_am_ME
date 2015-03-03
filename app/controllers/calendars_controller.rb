class CalendarsController < ApplicationController
  before_action :set_calendar, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  prepend_before_filter :require_no_authentication, :only => [ :new, :create, :cancel ]


  # GET /calendars
  # GET /calendars.json
  def index
    @calendar = current_user.calendars.find_by(name: "Me")
    redirect_to "/users/#{current_user.id}/calendars/#{@calendar.id}"
  end

  # GET /calendars/1
  # GET /calendars/1.json
  def show
    @calendar = Calendar.find(params[:id])
    @events = @calendar.events.all
    @time = Time.now
    @hour = Time.parse("1:00 am", @time)
    @number_of_hours = @hour + 82800

    if params[:week] == "next_week"
      @day = @calendar.find_future_monday(params[:wkid].to_i)
      @sunday = @calendar.find_future_sunday(params[:wkid].to_i)
    else params[:week] == "next_week"
      @day = @calendar.find_monday
      @sunday = @calendar.find_sunday(@day)
    end



  end

  # GET /calendars/new
  def new
    @calendar = Calendar.new
  end


  # GET /calendars/1/edit
  def edit
  end

  def mebutton
    @event = Event.find(params[:event_id])
    current_user.calendars.where(:name=>'Me').sample.events << @event
    redirect_to "/"
  end

  # POST /calendars
  # POST /calendars.json
  def create
    @calendar = Calendar.new(calendar_params)
    @calendar.user_id = current_user.id

    respond_to do |format|
      if @calendar.save
        current_user.calendars << @calendar
        format.html { redirect_to @calendar, notice: 'Calendar was successfully created.' }
        format.json { render :show, status: :created, location: @calendar }
      else
        format.html { render :new }
        format.json { render json: @calendar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /calendars/1
  # PATCH/PUT /calendars/1.json
  def update
    respond_to do |format|
      if @calendar.update(calendar_params)
        format.html { redirect_to @calendar, notice: 'Calendar was successfully updated.' }
        format.json { render :show, status: :ok, location: @calendar }
      else
        format.html { render :edit }
        format.json { render json: @calendar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calendars/1
  # DELETE /calendars/1.json
  def destroy
    @calendar.destroy
    respond_to do |format|
      format.html { redirect_to calendars_url, notice: 'Calendar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_calendar
      @calendar = Calendar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def calendar_params
      params[:calendar]
    end
end
