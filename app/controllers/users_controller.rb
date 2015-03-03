class UsersController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  # before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @joined_on = @user.created_at.to_formatted_s(:short)
    if @user.current_sign_in_at
      @last_login = @user.current_sign_in_at.to_formatted_s(:short)
    else
      @last_login = "never"
    end
  end

  # GET /users/new
  def new
    # @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    # @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    # if user_params[:password].blank?
    #   Rails.logger.info "entered if statement"
    #   user_params.delete :password
    #   user_params.delete :password_confirmation
    #   Rails.logger.info(user_params.inspect)
    # end
    # @user = current_user
    # if @user.update(user_params)
    #   redirect_to @user, notice: 'User was successfully updated.'
    # else
    #   Rails.logger.info(@user.errors.inspect)
    #   render action: 'edit'
    # end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_user
    #   @user = User.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :current_password, :name, :role_id)
    end
end
