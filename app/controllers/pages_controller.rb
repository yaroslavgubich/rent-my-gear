class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @gears = Gear.limit(10) # Adjust the limit as needed
  end
end
