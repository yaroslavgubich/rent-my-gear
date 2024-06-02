class GearsController < ApplicationController
  # GET /gears
  def index
    @gears = Gear.all
  end

  # GET /gears/1
  def show
    @gear = Gear.find(params[:id])
  end

  # Get /gears/new
  def new
    @gear = Gear.new
  end

  # POST /gears
  def create
    @gear = Gear.new(gear_params)
    @gear.user_id = current_user.id
    if @gear.save
      redirect_to gear_path(@gear)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /gears/1/edit
  def edit
    @gear = Gear.find(params[:id])
  end

  # PATCH/PUT
  def update
    @gear = Gear.find(params[:id])
    if @gear.update(gear_params)
      redirect_to gear_path(@gear)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @gear = Gear.find(params[:id])
    @gear.destroy
    redirect_to gears_path, status: :see_other
  end

  private

  def gear_params
    params.require(:gear).permit(:title, :description, :price_per_day, :category, :availability)
  end
end
