require 'csv'

class PointsController < ApplicationController
  before_action :set_point, only: [:show, :edit, :update, :destroy]

  # GET /points
  # GET /points.json
  def index
    @points = Point.all
    respond_to do |format|
      format.html { render action: 'index' }
      format.json { @ponts.to_json }
      format.csv { send_data csv(@points) }
    end
  end

  # GET /points/1
  # GET /points/1.json
  def show
  end

  # GET /points/new
  def new
    @point = Point.new
  end

  # GET /points/1/edit
  def edit
  end

  # POST /points
  # POST /points.json
  def create
    @point = Point.new(point_params)

    respond_to do |format|
      if @point.save
        format.html { redirect_to @point, notice: 'Point was successfully created.' }
        format.json { render action: 'show', status: :created, location: @point }
      else
        format.html { render action: 'new' }
        format.json { render json: @point.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /points/1
  # PATCH/PUT /points/1.json
  def update
    respond_to do |format|
      if @point.update(point_params)
        format.html { redirect_to @point, notice: 'Point was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @point.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /points/1
  # DELETE /points/1.json
  def destroy
    @point.destroy
    respond_to do |format|
      format.html { redirect_to points_url }
      format.json { head :no_content }
    end
  end

  private
    def csv(points)
      CSV.generate do |csv|
        csv << ["Id", "Day", "Weather", "Speed", "Device", "Total Time", "Total Distance", "Time", "Distance"]
        points.each do |point|
          csv << [point.id,
                  point.test.test_run.day.test_date,
                  point.test.test_run.day.weather_condition,
                  point.test.test_run.speed,
                  point.test.device_name,
                  point.test.time,
                  point.test.distance,
                  point.time,
                  point.distance]
        end
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_point
      @point = Point.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def point_params
      params.require(:point).permit(:latitude, :longitude, :time_recorded)
    end
end
