class CalendarsController < ApplicationController
  before_action :set_calendar, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  prepend_before_filter :require_no_authentication, :only => [ :new, :create, :cancel ]

  # GET /calendars
  # GET /calendars.json
  def index
    @user = current_user.id
    @events = Event.all
    @calendar = Calendar.new
    @day = @calendar.find_monday
    @sunday = @calendar.find_sunday(@day)

    if params[:week] == 'next_week' 
     @day = @calendar.next_week(@day)
     @sunday = @calendar.next_week(@sunday)
    elsif params[:week] == 'last_week'
      @day = @calendar.last_week(@day)
      @sunday = @calendar.last_week(@sunday)
    else
      @day
      @sunday
    end

    
    @time = Time.now
    @hour = Time.parse("1:00 am", @time)
    @number_of_hours = @hour + 82800
  end

  # GET /calendars/1
  # GET /calendars/1.json
  def show
    redirect_to '/'

  end

  # GET /calendars/new
  def new
    @calendar = Calendar.new
  end

  # GET /calendars/1/edit
  def edit
  end

  # POST /calendars
  # POST /calendars.json
  def create
    @calendar = Calendar.new(calendar_params)

    respond_to do |format|
      if @calendar.save
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
