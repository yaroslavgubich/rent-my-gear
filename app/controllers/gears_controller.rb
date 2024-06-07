class GearsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_gear, only: %i[show edit update destroy]

  # GET /gears
  def index
    @gears = Gear.all
  end

  # GET /gears/1
  def show
    @booking = @gear.bookings.build
  end

  # GET /gears/new
  def new
    @gear = Gear.new
  end

  # POST /gears
  def create
    @gear = Gear.new(gear_params)
    @gear.user_id = current_user.id
    puts "Current user: #{current_user.inspect}"
    if @gear.save
      redirect_to gear_path(@gear)
    else
      puts @gear.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  # GET /gears/1/edit
  def edit
  end

  # PATCH/PUT /gears/1
  def update
    if @gear.update(gear_params)
      redirect_to gear_path(@gear)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /gears/1
  def destroy
    @gear.destroy
    redirect_to gears_path, status: :see_other
  end

  private

  def gear_params
    params.require(:gear).permit(:title, :description, :price_per_day, :category, :availability)
  end

  def set_gear
    @gear = Gear.find(params[:id])
  end
end
