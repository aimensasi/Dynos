# == Schema Information
#
# Table name: individuals
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  location   :string
#  avatar     :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class IndividualsController < ApplicationController

  before_action :require_login, :except => [:create, :new]
  
  def show
    @individual = Individual.find_by_id(params[:id])
  end

  def new
    @individual = Individual.new
  end

  def create
    @individual = Individual.new(individuals_params)
    @user = User.new(user_params.merge(:role => "individual"))
    if @user.save
      @individual.user = @user
      @individual.save
      log_in @user
      redirect_to individuals_show_path @user
    else
      flash.alert = "Invalid Email Or Password"
      render :new
    end
  end
  
  def update
    @individual = Individual.find_by_id(params[:id])
    if @individual.update_attributes individuals_params
      flash.notice = "Updated Successfully"
      redirect_to individuals_show_path @user
    else
      flash.notice = "Invalid Attributes"
      redirect_to individuals_show_path @user      
    end
  end

  def destroy
    # byebug
    @individual = Individual.find_by_id(params[:id])
    @individual.user.destroy
    log_out
    
    redirect_to root_url
  end

  
  private 
  def individuals_params
    params.require(:individual).permit(:first_name, :last_name, :location, :avatar)
  end

  def user_params
    params.require(:individual).permit(:email, :password)
  end
end
