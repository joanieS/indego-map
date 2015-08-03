require 'open-uri'
class WelcomeController < ApplicationController
  def index
  	
  	@station_data = JSON.parse(open("https://api.phila.gov/bike-share-stations/v1").read)
  	@stations = @station_data['features']

  	@hash = Gmaps4rails.build_markers @stations do |station, marker|
  		marker.lat latitude(station)
  		marker.lng longitude(station)
  	end

  end


  def latitude(station)
  	station['geometry']['coordinates'][0]
  end

  def longitude(station)
  	station['geometry']['coordinates'][1]
  end
end
