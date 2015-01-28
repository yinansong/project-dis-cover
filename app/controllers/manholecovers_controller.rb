class ManholecoversController < ApplicationController
  before_action :set_manholecover, only: [:show, :edit, :update, :destroy]

  # GET /collectors/1/manholecovers
  # GET /collectors/1/manholecovers.json
  def index
    @collector = ::Collector.find_by(id: params[:collector_id])
    @manholecovers = @collector.manholecovers
  end

  # GET /collectors/1/manholecovers/new
  def new
    @collector = ::Collector.find_by(id: params[:collector_id])
    @manholecover = @collector.manholecovers.new
    # something is wrong with the above line
  end

  # GET /manholecovers/1
  # GET /manholecovers/1.json
  def show
    @collector = ::Collector.find(@manholecover.collector_id)
    @manholecover = @collector.manholecovers.find(params[:id])
    # get random manhole covers of the same color
    color = @manholecover.color
    manholes_of_same_color = Manholecover.all.select do |manhole_entry|
      manhole_entry["color"] == "#{color}"
    end
    @random_manhole_of_same_color1 = manholes_of_same_color.sample
    @random_manhole_of_same_color2 = manholes_of_same_color.sample
    @random_manhole_of_same_color3 = manholes_of_same_color.sample
  end

  # GET /collectors/1/manholecovers/1/edit
  def edit
    @collector = ::Collector.find_by(id: params[:collector_id])
    @manholecover = @collector.manholecovers.find(params[:id])
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

  # POST /collectors/1/manholecovers
  # POST /collectors/1/manholecovers.json
  def create
    @collector = ::Collector.find_by(id: params[:collector_id])
    # binding.pry
    @manholecover = Manholecover.new(manholecover_params)
    @manholecover.keywords = params[:manholecover][:keywords].downcase.split(", ")
    @manholecover.collector_id = @collector.id
    respond_to do |format|
      if @manholecover.save
        format.html { redirect_to collector_manholecovers_path, notice: 'Manholecover was successfully created.' }
        format.json { render :show, status: :created, location: @manholecover }
      else
        format.html { render :new }
        format.json { render json: @collector.manholecover.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT collectors/1/manholecovers/1
  # PATCH/PUT collectors/1/manholecovers/1.json
  def update
    @collector = ::Collector.find_by(id: params[:collector_id])
    respond_to do |format|
      if @manholecover.update(manholecover_params)
        format.html { redirect_to collector_manholecover_path, notice: 'Manhole Cover was successfully updated.' }
        format.json { render :show, status: :ok, location: @manholecover }
      else
        format.html { render :edit }
        format.json { render json: @collector.manholecover.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE collectors/1/manholecovers/1
  # DELETE collectors/1/manholecovers/1.json
  def destroy
    @collector = ::Collector.find_by(id: params[:collector_id])
    @manholecover = Manholecover.find(params[:id])
    @manholecover.delete
    respond_to do |format|
      format.html { redirect_to collector_manholecovers_path, notice: 'Manholecover was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manholecover
      @collector = ::Collector.find_by(id: params[:user_id])
      @manholecover = Manholecover.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def manholecover_params
      params.require(:manholecover).permit(:id, :manhole_img, :country, :region, :city, :year, :color, :keywords, :notes, :featured, :collector_id, :_method)
    end
end
