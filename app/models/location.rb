class Location < ActiveRecord::Base
  attr_accessible :lat, :lng, :status, :username, :name, :country, :city, :iso2, :population
end
