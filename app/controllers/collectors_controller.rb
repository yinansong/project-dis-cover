class CollectorsController < ApplicationController
  before_filter :authenticate_collector!
  before_action :set_collector, only: [:show, :edit, :update, :destroy]

  # GET /collectors/1/collection
  def collection
    @collector = ::Collector.find_by(id: params[:id])
    @manholecovers = @collector.manholecovers
    @no_mhcv = @manholecovers.size
    # calculate the number of citis & countries the collector collects manholecovers from
    @cities = @manholecovers.map do |manholecover|
      manholecover.city
    end
    @no_cities = @cities.uniq.size
    @countries = @manholecovers.map do |manholecover|
      manholecover.country
    end
    @no_countries = @countries.uniq.size
    # find the city where the collector collects the most manholecovers from
    @most_city = @cities.group_by do |e|
      e
    end.values.max_by(&:size).first
    # find the keyword that the collector uses the most often
    @all_keywords = @manholecovers.map { |manholecover| manholecover.keywords}.flatten
    if @all_keywords.group_by {|e| e }.values.max_by(&:size) == nil
      @most_keyword = "none"
    else
      @most_keyword = @all_keywords.group_by {|e| e }.values.max_by(&:size).first
    end
  end

  # GET /collectors
  # GET /collectors.json
  def index
    @collectors = ::Collector.all
  end

  # GET /collectors/1
  # GET /collectors/1.json
  def show
    @collector = ::Collector.find(params[:id])
    @mhcv_number = @collector.manholecovers.size
    @joined_on = @collector.created_at.to_formatted_s(:short)
    if @collector.current_sign_in_at
      @last_login = @collector.current_sign_in_at.to_formatted_s(:short)
    else
      @last_login = "never"
    end
    if @role.collectors.length == 0
      @assosciated_collectors = "None"
    else
      @assosciated_collectors = @role.collectors.map(&:name).join(", ")
    end
  end

  # GET /collectors/new
  def new
    @collector = ::Collector.new
  end

  # GET /collectors/1/edit
  def edit
  end

  # POST /collectors
  # POST /collectors.json
  def create
    @collector = ::Collector.new(collector_params)

    respond_to do |format|
      if @collector.save
        format.html { redirect_to @collector, notice: 'Collector was successfully created.' }
        format.json { render :show, status: :created, location: @collector }
      else
        format.html { render :new }
        format.json { render json: @collector.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /collectors/1
  # PATCH/PUT /collectors/1.json
  def update
    if collector_params[:password].blank?
      collector_params.delete(:password)
      collector_params.delete(:password_confirmation)
    end
    successfully_updated = if needs_password?(@collector, collector_params)
                            @collector.update(collector_params)
                          else
                            @collector.update_without_password(collector_params)
                          end
    respond_to do |format|
      if @collector.update(collector_params)
        format.html { redirect_to @collector, notice: 'Collector was successfully updated.' }
        format.json { render :show, status: :ok, location: @collector }
      else
        format.html { render :edit }
        format.json { render json: @collector.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collectors/1
  # DELETE /collectors/1.json
  def destroy
    @collector.destroy
    respond_to do |format|
      format.html { redirect_to collectors_url, notice: 'Collector was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  protected
    def needs_password?(collector, params)
    params[:password].present?
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collector
      @collector = ::Collector.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def collector_params
      params.require(:collector).permit(:avatar, :name, :email, :password, :password_confirmation, :role_id)
    end

end
