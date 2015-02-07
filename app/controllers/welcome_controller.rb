class WelcomeController < ApplicationController
  def index
    @manholecovers = Manholecover.all
    @sample_mhcv = @manholecovers.sample(20)

    #for the data in the summary line
    @cities = @manholecovers.map do |manhole_entry|
      manhole_entry["city"].downcase
    end
    @number_of_cities_uniq = @cities.uniq.size
    @countries = @manholecovers.map do |manhole_entry|
      manhole_entry["country"]
    end
    @number_of_countries_uniq = @countries.uniq.size
    # number of collectors in total
    @number_of_collectors = @manholecovers.map {|m| m.collector}.size
  end

  def instagram
    # instagram feed
    tagged_w_manholecover_all = HTTParty.get("https://api.instagram.com/v1/users/1540068060/media/recent/?client_id=a0d18232c4ae42cd8ddb1343a263cd32")
    # tagged_w_manholecover_all = HTTParty.get("https://api.instagram.com/v1/tags/manhole/media/recent?client_id=a0d18232c4ae42cd8ddb1343a263cd32")
    @tagged_w_manholecover = tagged_w_manholecover_all["data"]
      # @tagged_w_manholecover is an array

  end
end
