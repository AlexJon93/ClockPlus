class StaticPagesController < ApplicationController
    def main
        @cities = City.all()
    end
end
