# == Schema Information
#
# Table name: schools
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  location    :string
#  category    :string
#  avatar      :string
#  reviews     :integer
#  min_age     :integer
#  max_age     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#

class SchoolsController < ApplicationController
  before_action :require_login, except: [:create, :new, :index, :show]


  def index
    @schools = School.all
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

    if @school.update_attributes school_params
      flash.notice = "Your Information Has Been Updated"
      redirect_to edit_school_path @school
    else
      flash.alert = "Could not Updated Your Information"
      render :edit
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
      params.require(:school).permit(:name, :description, :location, :category, :avatar, :min_age, :max_age, :reviews)
    end

    def user_params
      params.require(:school).permit(:email, :password)
    end
end
