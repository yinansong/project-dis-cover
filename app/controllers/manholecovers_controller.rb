class ManholecoversController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  # before_action :set_manholecover, only: [:show, :edit, :update, :destroy]

  # GET /users/1/manholecovers
  # GET /users/1/manholecovers.json
  def index
    if @user
      @user_name = User.find_by(id: params[:user_id]).name
      @manholecovers = @user.manholecovers
    else
      @user_name = "All Users"
      @manholecovers = Manholecover.all
    end
  end

  # GET /users/1/manholecovers/new
  def new
    @user = User.find_by(id: params[:user_id])
    # @manholecover = @user.manholecovers.new
    # something is wrong with the above line
  end

  # GET /manholecovers/1
  # GET /manholecovers/1.json
  def show
    @user = User.find(@manholecover.user_id)
    @manholecover = @user.manholecovers.find(params[:id])
    # get random manhole covers of the same color
    color = @manholecover.color
    manholes_of_same_color = Manholecover.all.select do |manhole_entry|
      manhole_entry["color"] == "#{color}"
    end
    @random_manhole_of_same_color1 = manholes_of_same_color.sample
    @random_manhole_of_same_color2 = manholes_of_same_color.sample
    @random_manhole_of_same_color3 = manholes_of_same_color.sample
  end

  # GET /users/1/manholecovers/1/edit
  def edit
    if params[:user_id]
      @user = User.find_by(id: params[:user_id])
      @manholecover = @user.manholecovers.find(params[:id])
    else
      @manholecover = Manholecover.find(params[:id])
    end
  end

  # GET /manholecovers/city/:city
  def city
    @city = params[:city].downcase
    @manholecovers = Manholecover.all
    @certain_city_array = @manholecovers.select do |manhole_entry|
      manhole_entry["city"].downcase == @city
    end
  end

  # GET /manholecovers/region/:region
  def region
    @region = params[:region].downcase
    @manholecovers = Manholecover.all
    @certain_region_array = @manholecovers.select do |manhole_entry|
      manhole_entry["region"].downcase == @region
    end
  end

  # GET /manholecovers/country/:country
  def country
    @country = params[:country].downcase
    @manholecovers = Manholecover.all
    @certain_country_array = @manholecovers.select do |manhole_entry|
      manhole_entry["country"].downcase == @country
    end
  end

  # GET /manholecovers/year/:year
  def year
    @year = params[:year].to_i
    @manholecovers = Manholecover.all
    @certain_year_array = @manholecovers.select do |manhole_entry|
      manhole_entry["year"] == @year
    end
  end

  # GET /manholecovers/keyword/:keyword
  def keywords
    @keyword = params[:keyword]
    @manholecovers = Manholecover.all
    @with_keyword_array = @manholecovers.select do |manhole_entry|
      manhole_entry["keywords"].include?"#{@keyword}"
    end
  end

  # POST /users/1/manholecovers
  # POST /users/1/manholecovers.json
  def create
    @user = User.find_by(id: params[:user_id])
    # binding.pry
    # @manholecover = Manholecover.new(manholecover_params)
    @manholecover.keywords = params[:manholecover][:keywords].downcase.split(", ")
    @manholecover.user_id = @user.id
    respond_to do |format|
      if @manholecover.save
        format.html { redirect_to user_manholecovers_path, notice: 'Manholecover was successfully created.' }
        format.json { render :show, status: :created, location: @manholecover }
      else
        format.html { render :new }
        format.json { render json: @user.manholecover.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT users/1/manholecovers/1
  # PATCH/PUT users/1/manholecovers/1.json
  def update
    if params[:user_id]
      @user = User.find_by(id: params[:user_id])
      # binding.pry
      input_keywords = params[:manholecover][:keywords].downcase.split(", ")
      @manholecover.update(keywords: input_keywords)
      # @manholecover.keywords_will_change!
      # @manholecover.attributes = params[:keywords]
      @manholecover.keywords_will_change!
      # @manholecover.save!
      respond_to do |format|
        if @manholecover.update(manholecover_params)
          format.html { redirect_to user_manholecover_path, notice: 'Manhole Cover was successfully updated.' }
          format.json { render :show, status: :ok, location: @manholecover }
        else
          format.html { render :edit }
          format.json { render json: @user.manholecover.errors, status: :unprocessable_entity }
        end
      end
    else
      input_keywords = params[:manholecover][:keywords].downcase.split(", ")
      @manholecover = Manholecover.find(params[:id])
      # @manholecover.update
      respond_to do |format|
        if @manholecover.update(manholecover_params)
          format.html { redirect_to manholecover_path, notice: 'Manhole Cover was successfully updated.' }
          format.json { render :show, status: :ok, location: @manholecover }
        else
          format.html { render :edit }
          format.json { render json: @manholecover.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE users/1/manholecovers/1
  # DELETE users/1/manholecovers/1.json
  def destroy
    @user = User.find_by(id: params[:user_id])
    @manholecover = Manholecover.find(params[:id])
    @manholecover.delete
    respond_to do |format|
      format.html { redirect_to user_manholecovers_path, notice: 'Manholecover was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manholecover
      @user = User.find_by(id: params[:user_id])
      @manholecover = Manholecover.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def manholecover_params
      params.require(:manholecover).permit(:id, :manhole_img, :country, :region, :city, :year, :color, :keywords, :notes, :featured, :user_id, :_method)
    end

end
