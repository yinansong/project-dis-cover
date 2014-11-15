class ManholecoversController < ApplicationController
  before_action :set_manholecover, only: [:show, :edit, :update, :destroy]

  # GET /manholecovers
  # GET /manholecovers.json
  def index
    @manholecovers = Manholecover.all
  end

  # GET /manholecovers/1
  # GET /manholecovers/1.json
  def show
  end

  # GET /manholecovers/new
  def new
    @manholecover = Manholecover.new
  end

  # GET /manholecovers/1/edit
  def edit
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
