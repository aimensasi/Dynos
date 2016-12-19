class SchoolsController < ApplicationController
  before_action :require_login, except: [:create, :new, :index, :show]
  before_action :must_be_school, except: [:create, :new, :index, :show]

  def index
    @schools = School.order(reviews: :desc).paginate(:page => params[:page], :per_page => 30)
  end

  def show
    @school = School.find_by_id(params[:id])
  end

  def new
    @school = School.new
  end

  def create
    @school = School.new(school_params)
    @user = User.new(user_params.merge(:role => "school"))

    if @user.save

      @school.user = @user
      @school.save

      log_in @user

      flash.notice = "Welcome To Dynos"
      redirect_to edit_school_path @school
    else

      flash.alert = "Invalid Email Or Password"
      render 'new'
    end
  end


  def edit
    @school = School.find_by_id(params[:id])
  end


  def update
    @school = School.find_by_id(params[:id])
    respond_to do |format|
      if remotipart_submitted?
        if img_params[:bg_img]
          @school.update(:bg_img => img_params[:bg_img]) 
        else
          @school.update(:logo => img_params[:logo]) 
        end
        @school.reload
        format.json
      else
        if @school.update_attributes school_params
          flash.notice = "Your Information Has Been Updated"
          redirect_to edit_school_path @school
        else
          flash.alert = "Could not Updated Your Information"
          render :edit
        end
      end
    end
  end

  def destroy
    @school = School.find_by_id(params[:id])
    @school.user.destroy
    log_out
    redirect_to root_path
  end

  private
    def school_params
      params.require(:school).permit(:name, :description, :location, :category, :min_age, :max_age, :reviews)
    end

    def user_params
      params.require(:user).permit(:email, :password)
    end

    def img_params
      params.require(:school).permit(:bg_img, :logo)
    end
end
