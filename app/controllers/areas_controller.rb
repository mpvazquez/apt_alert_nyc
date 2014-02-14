class AreasController < ApplicationController

  before_action :load_area, only: [:index]

  def index
  end

  private

  def load_area
    @area = Area.all
  end

end