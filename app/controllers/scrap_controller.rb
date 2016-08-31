require 'octopus'
require 'json'

class ScrapController < ApplicationController
  attr_reader :from, :to, :date

  def index
    # puts params
    @from = params["from"]
    @to = params["to"]
    @date = DateTime.parse(params["date"]).strftime('%F') if params["date"].present? 
    # puts @date
    # puts "Works fine!"
    if @from.present? && @to.present? && @date.present?
      octopus = Octopus::United.new(@from,@to,@date)
      # puts octopus
      @octopus = octopus.get_data
    else
      render 'index'
    end
    respond_to do |format|
      # if the response fomat is html, redirect as usual
      format.html { }

      # if the response format is javascript, do something else...
      format.js { }
    end
  end

  private

    def scrap_params
      params.require(:scrap).permit(:from, :to, :date)
    end
end
