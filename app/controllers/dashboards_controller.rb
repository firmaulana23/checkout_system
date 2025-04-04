class DashboardsController < ApplicationController
  def index
    @menu_items = Menu.all
    @categories = Menu.select(:category).distinct
  end
end
