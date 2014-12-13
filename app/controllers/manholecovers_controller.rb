class ManholecoversController < ApplicationController
  before_action :set_manholecover, only: [:show, :edit, :update, :destroy]

  # GET /manholecovers
  # GET /manholecovers.json
  def index
    binding.pry
    @manholecovers = Manholecover.all

    #for the data in the summary line
    @cities = @manholecovers.map do |manhole_entry|
      manhole_entry["city"].downcase
    end
    @number_of_cities_uniq = @cities.uniq.size
    @countries = @manholecovers.map do |manhole_entry|
      manhole_entry["country"]
    end
    @number_of_countries_uniq = @countries.uniq.size
  end

  # GET /manholecovers/1
  # GET /manholecovers/1.json
  def show
    @manholecover = Manholecover.find(params[:id])

    # get random manhole covers of the same color
    color = @manholecover.color
    manholes_of_same_color = Manholecover.all.select do |manhole_entry|
      manhole_entry["color"] == "#{color}"
    end
    @random_manhole_of_same_color1 = manholes_of_same_color.sample
    @random_manhole_of_same_color2 = manholes_of_same_color.sample
    @random_manhole_of_same_color3 = manholes_of_same_color.sample
  end

  # GET /manholecovers/new
  def new
    @manholecover = Manholecover.new
  end

  # GET /manholecovers/1/edit
  def edit
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

  # POST /manholecovers
  # POST /manholecovers.json
  def create
    @manholecover = Manholecover.new(manholecover_params)

    respond_to do |format|
      if @manholecover.save
        format.html { redirect_to @manholecover, notice: 'Manholecover was successfully created.' }
        format.json { render :show, status: :created, location: @manholecover }
      else
        format.html { render :new }
        format.json { render json: @manholecover.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /manholecovers/1
  # PATCH/PUT /manholecovers/1.json
  def update
    respond_to do |format|
      if @manholecover.update(manholecover_params)
        format.html { redirect_to @manholecover, notice: 'Manholecover was successfully updated.' }
        format.json { render :show, status: :ok, location: @manholecover }
      else
        format.html { render :edit }
        format.json { render json: @manholecover.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manholecovers/1
  # DELETE /manholecovers/1.json
  def destroy
    @manholecover.destroy
    respond_to do |format|
      format.html { redirect_to manholecovers_url, notice: 'Manholecover was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manholecover
      @manholecover = Manholecover.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def manholecover_params
      params[:manholecover]
    end
end
