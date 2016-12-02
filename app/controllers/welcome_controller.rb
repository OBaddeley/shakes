class WelcomeController < ApplicationController
  def index
    request = Typhoeus.get("api.geonet.org.nz/quake?MMI=1",
        headers: {'Accept'=> "application/vnd.geo+json;version=2"}
    )

    shake_hash = JSON.parse(request.body)
    @quakes = shake_hash["features"]
    
  end
end
