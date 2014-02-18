class AreasController < ApplicationController

  before_action :load_area, only: [:show]
  before_action :load_all, only: [:index, :show]

  def index
  end

  def show
  end

  private

  def load_area
    @area = Area.find(params[:id])
  end

  def load_all
    @areas = Area.all
  end

end