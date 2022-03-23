class AttractionsController < ApplicationController
    before_action :admin, except: [:index, :show]

    def index
        @attractions = Attraction.all
      end

      def new
        @attraction = Attraction.new
      end
    
      def create
        @attraction = Attraction.create(attraction_params)
        #if @attraction
        redirect_to attraction_path(@attraction)
        #else
        #    render :new
        #end
      end

      def show
        @attraction = Attraction.find_by(id: params[:id])
        ride = @attraction.rides.build(user_id: current_user.id)
      end
    
      def edit
        @attraction = Attraction.find_by(id: params[:id])
        #@ride = @attraction.rides.build(user_id: current_user.id)
      end
    
      def update
        attraction = Attraction.find_by(id: params[:id])
        attraction.update(attraction_params)
        if attraction.save
            redirect_to attraction_path(attraction)
        end
      end
    
      private
        def attraction_params
          params.require(:attraction).permit(
            :name,
            :min_height,
            :tickets,
            :happiness_rating,
            :nausea_ratiing
          )
        end
    
end