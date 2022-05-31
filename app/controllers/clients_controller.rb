class ClientsController < ApplicationController

    def show
        client = Client.find(params[:id])
        render json: client, status: :ok
    rescue RecordNotFound
        render json: {errors: client.errors.full_messages}, status: :not_found
    end

end
