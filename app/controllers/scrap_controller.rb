require 'octopus'
require 'json'

class ScrapController < ApplicationController
  attr_reader :from, :to, :date

  def index
    @from = params["from"]
    @to = params["to"]
    @date = DateTime.parse(params["date"]).strftime('%F') if params["date"].present? 
    if @from.present? && @to.present? && @date.present?
      octopus = Octopus::United.new(@from,@to,@date)
      @octopus = octopus.get_data
    else
      render 'index'
    end
    respond_to do |format|
      format.html { }
      format.js { }
    end
  end

  private

    def scrap_params
      params.require(:scrap).permit(:from, :to, :date)
    end
end
