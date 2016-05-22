class MapsController < ApplicationController
  before_action :set_map, only: [:show, :edit, :update, :destroy]

  # GET /maps
  # GET /maps.json
  def index
    @flat = Flat.find_by(id: current_flatmate.Flat_id)
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_map
      @map = Map.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def map_params
      params.fetch(:map, {})
    end
end
