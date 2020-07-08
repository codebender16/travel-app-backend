class CountriesController < ApplicationController
  before_action :find_country, only: %i[show update destroy]

  def index
    @countries = Country.all
    render json: @countries
  end

  def show
    render json: @country
  end

  def create
    country = Country.new(country_params)
    if(country.save)
      render header: :created
    else
      render json: {error: country.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update 
    if @country.update(country_params)
      render status: :no_content
    else
      render json: {error: @country.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @country.delete
    render status: :no_content
  end

  private

  def country_params
    params.require(:country).permit(:name, :description, :airline, :year)
  end

  def find_country
    @country = Country.find(params[:id])
  end

  

end
