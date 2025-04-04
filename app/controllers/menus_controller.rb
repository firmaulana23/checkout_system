class MenusController < ApplicationController
  before_action :set_menu, only: [ :edit, :update, :destroy ]

  def index
    @menus = Menu.all
  end

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(menu_params)
    if @menu.save
      redirect_to menus_path, notice: "Menu berhasil ditambahkan!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @menu.update(menu_params)
      redirect_to menus_path, notice: "Menu berhasil diperbarui!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @menu.destroy
    redirect_to menus_path, notice: "Menu berhasil dihapus!"
  end

  private

  def set_menu
    @menu = Menu.find(params[:id])
  end

  def menu_params
    params.require(:menu).permit(:name, :price)
  end
end
