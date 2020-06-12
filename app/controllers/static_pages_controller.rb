class StaticPagesController < ApplicationController
    def main
        if session[:list].nil?
            session[:list] = City.populate_list
        end
        
        @cities = City.city_list(session[:list])
    end

    def add
    end

    def remove
        session[:list].delete(params[:item].to_i)
        @cities = City.city_list(session[:list])
        
        respond_to do |format|
            format.js {render 'static_pages/refresh'}
        end
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

    def refresh
        @cities = City.city_list(session[:list])
        respond_to do |format|
            format.js
        end
    end

    def toggle_hour
        session[:twentyfour] = params[:setting] == 'true'
        redirect_to refresh_path
    end
end
