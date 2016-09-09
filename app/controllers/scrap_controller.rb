require 'octopus'
require 'json'

class ScrapController < ApplicationController
  attr_reader :from, :to, :date, :login, :password, :program

  def index
    @from = params["from"]
    @to = params["to"]
    @date = DateTime.parse(params["date"]).strftime('%F') if params["date"].present?
    @program = params["program"]
    @login = params["login"]
    @password = params["password"]

    if @from.present? && @to.present? && @date.present?
      if @program == 'aeroplan'
        octopus = Octopus::Aeroplan.new(@from,@to,@date,@login,@password)
        @aeroplan = octopus.get_data
      else
        octopus = Octopus::United.new(@from,@to,@date)
        @united = octopus.get_data
      end
      
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
      params.require(:scrap).permit(:from, :to, :date, :login, :password, :program)
    end
end
