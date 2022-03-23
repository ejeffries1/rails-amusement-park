class RidesController < ApplicationController

  
     def create
        ride = Ride.create(user_id: current_user.id, attraction_id: params[:attraction_id])
        if ride
            message = ride.take_ride
            redirect_to user_path(ride.user), flash: {message: message}
        else
            redirect_to attraction_path(ride.attraction)
        end
     end
end