require 'csv'

class TestsController < ApplicationController
  before_action :set_test, only: [:show, :edit, :update, :destroy]

  # GET /tests
  # GET /tests.json
  def index
    @tests = Test.order(:test_run_id, :id)
    respond_to do |format|
      format.html { render action: 'index' }
      format.json { @ponts.to_json }
      format.csv { send_data csv(@tests) }
    end
  end

  # GET /tests/1
  # GET /tests/1.json
  def show
  end

  # GET /tests/new
  def new
    @test = Test.new
  end

  # GET /tests/1/edit
  def edit
  end

  # POST /tests
  # POST /tests.json
  def create
    @test = Test.new(test_params)

    respond_to do |format|
      if @test.save
        format.html { redirect_to @test, notice: 'Test was successfully created.' }
        format.json { render action: 'show', status: :created, location: @test }
      else
        format.html { render action: 'new' }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tests/1
  # PATCH/PUT /tests/1.json
  def update
    respond_to do |format|
      if @test.update(test_params)
        format.html { redirect_to @test, notice: 'Test was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tests/1
  # DELETE /tests/1.json
  def destroy
    @test.destroy
    respond_to do |format|
      format.html { redirect_to tests_url }
      format.json { head :no_content }
    end
  end

  private

    def csv(tests)
      CSV.generate do |csv|
        csv << ["Id", "Day", "Weather", "Temperature", "Pressure", "Speed", "Device", "Points", "Time", "Average Distance", "Distance", "Deviation", "Standard Deviation"]
        tests.each do |test|
          csv << [test.id,
                  test.test_run.day.test_date,
                  test.test_run.day.weather_condition,
                  test.test_run.day.temperature,
                  test.test_run.day.pressure,
                  test.test_run.speed,
                  test.device_name,
                  test.points.count,
                  test.time,
                  test.test_run.average_distance.round(4),
                  test.distance.round(4),
                  test.deviation.round(4),
                  test.test_run.standard_deviation.round(4)]
        end
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_test
      @test = Test.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_params
      params.require(:test).permit(:device_name, :test_run_id, :distance, :time)
    end
end
