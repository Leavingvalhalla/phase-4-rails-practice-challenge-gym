class ClientsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :not_found

    def index
        render json: Client.all
    end

    def update
        client = Client.find(params[:id])
        client.update(client_params)
        if client.valid?
            render json: client, status: :accepted
        else
            render json: {errors: 'bad params'}, status: :unprocessable_entity
        end
    end

    def show
        client = Client.find(params[:id])        
        render json: client
        # , include: :memberships, only: [:charges]
    end

private
    def client_params
        params.permit(:name, :age)
    end

    def not_found
        render json: {errors: 'client not found'}, status: :not_found
    end

end