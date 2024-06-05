class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home


  def home
   @gears = Gear.all
  end
  def index
   @gears = Gear.all
  end
end
