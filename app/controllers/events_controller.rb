class EventsController < ApplicationController
  before_action :require_login, except: [:show, :index]
  before_action :must_be_school, except: [:index, :show]
  def index
    @events = Event.paginate(:page => params[:page], :per_page => 30)
  end

  def show
    @event = Event.find_by_id(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.school = User.find_by_id(session[:user_id]).school
    if @event.save
      flash.notice = "New Event Has Been Create"
      redirect_to event_path @event
    else
      flash.now.alert = "Invalid Attributes"
      render :new
    end

  end

  def edit
    @event = Event.find_by_id(params[:id])
  end

  def update
    @event = Event.find_by_id(params[:id])
    if @event.update_attributes event_params
      flash.notice = "Updated Event successfully"
      redirect_to @event
    else
      flash.now.alert = "Something Went Wrong, Could not updated your event"
      render :edit
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find_by_id(params[:id])
    @event.delete
    flash.notice = "Your Event Was Deleted Successfully"
    redirect_to edit_school_path @event.school, :anchor => "your-events"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :description, :date, :location, :start_time, :end_time, :min_age, :max_age, :price)
    end


end
