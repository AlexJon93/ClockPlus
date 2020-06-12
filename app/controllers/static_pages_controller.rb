class StaticPagesController < ApplicationController
    def main
        @cities = City.all()
    end

    def toggle_hour
        @cities = City.all()
        session[:twentyfour] = params[:setting] == 'true'
        respond_to do |format|
            format.js
        end
    end
end
