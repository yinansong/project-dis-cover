class WelcomeController < ApplicationController
  def index
    @manholecovers = Manholecover.all
  end

  def instagram
    # instagram feed
    tagged_w_manholecover_all = HTTParty.get("https://api.instagram.com/v1/users/1540068060/media/recent/?client_id=a0d18232c4ae42cd8ddb1343a263cd32")
    # tagged_w_manholecover_all = HTTParty.get("https://api.instagram.com/v1/tags/manhole/media/recent?client_id=a0d18232c4ae42cd8ddb1343a263cd32")
    @tagged_w_manholecover = tagged_w_manholecover_all["data"]
      # @tagged_w_manholecover is an array

  end
end
