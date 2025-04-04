class DashboardsController < ApplicationController
  def index
    @menu_items = Menu.all
  end
end
