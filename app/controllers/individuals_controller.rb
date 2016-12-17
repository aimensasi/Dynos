class IndividualsController < ApplicationController

  before_action :require_login, :except => [:create, :new]
  before_action :require_individual, :except => [:create, :new]

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
      flash.notice = "Welcome To Dynos"
      redirect_to edit_individual_path @individual
    else
      flash.alert = "Invalid Email Or Password"
      redirect_to new_individual_path
    end
  end

  def edit

    @individual = Individual.find_by_id(params[:id])
  end

  def update
    @individual = Individual.find_by_id(params[:id])
    if @individual.update_attributes individuals_params
      flash.notice = "Updated Successfully"
      redirect_to edit_individual_path @individual
    else
      flash.notice = "Invalid Attributes"
      redirect_to edit_individual_path @individual
    end
  end

  def destroy
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
    params.require(:user).permit(:email, :password)
  end
end
