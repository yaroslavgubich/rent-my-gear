class GearsController < ApplicationController
  def index
    @gears = Gear.all
  end
  def show
    @gear = Gear.find(params[:id])
  end
  def new
    @gear = Gear.new
  end

  def create
    @gear = Gear.new(gear_params)
    @gear.user_id = current_user.id
    if @gear.save
      redirect_to gear_path(@gear), notice: 'Gear was successfully created.'
    else
      render :new
    end
  end

  private

 def gear_params
  params.require(:gear).permit(:title, :description, :price_per_day, :category, :availability)
 end
end
