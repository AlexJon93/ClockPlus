class StaticPagesController < ApplicationController
    def main
        if session[:list].nil?
            session[:list] = City.populate_list
        end
        
        @cities = City.city_list(session[:list])
    end

    def add
    end

    def create
        city = City.find_by(name: params[:name])
        if city.nil?
            redirect_to add_path
        else
            session[:list].push(city.id)
            redirect_to root_path
        end
    end

    def toggle_hour
        @cities = City.city_list(session[:list])
        session[:twentyfour] = params[:setting] == 'true'
        respond_to do |format|
            format.js
        end
    end
end
