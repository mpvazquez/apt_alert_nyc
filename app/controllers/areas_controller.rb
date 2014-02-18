class AreasController < ApplicationController

  before_action :load_area, only: [:show]

  def index
    @areas = Area.all
  end

  def show
    @areas = Area.all
  end

  private

  def load_area
    @area = Area.find(params[:id])
  end

end