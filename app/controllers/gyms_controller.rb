class GymsController < ApplicationController
    def show
        gym = Gym.find(params[:id])
        render json: gym
        rescue RecordNotFound
            render json: {error: 'gym not found'}, status: 404
        end
    end

    def destroy
        gym = Gym.find(params[:id])
        gym.destroy
        render json: {}, status: :no_content
        rescue RecordNotFound
            render json: {error: 'gym not found'}, status: 404
        end
    end



end
