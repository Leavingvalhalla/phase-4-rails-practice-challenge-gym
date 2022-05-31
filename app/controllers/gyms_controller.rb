class GymsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :not_found
    def index
        render json: Gym.all
    end

    def update
        gym = Gym.find(params[:id])
        gym.update(gym_params)
        if client.valid?
            render json: client, status: :accepted
        else
            render json: {error: 'bad params'}, status: :unprocessable_entity
    end

    def show
        gym = Gym.find(params[:id])
        render json: gym
    end

    def destroy
        gym = Gym.find(params[:id])
        gym.destroy
        render json: {}, status: :no_content
    end


    private

    def gym_params
        params.permit(:name, :address)
    end

    def not_found
        render json: {error: 'Gym not found'}, status: 404
    end

end
