class CountriesController < ApplicationController

    def index
        @countries=Country.all 
    end

    def create
        @country=Country.new(country_params)
      
        if @country.valid? && @country.image_valid
            @country.save
            redirect_to countries_path
        else
            render :index
        end       
    end

    private

    def country_params
        params.require(:country).permit(:flag_image, :name)
    end
end
