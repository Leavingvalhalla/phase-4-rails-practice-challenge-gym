class MembershipsController < ApplicationController

    def create
        membership = Membership.new(membership_params)
        if membership.valid?
            render membership.save()
        else
            render json: {errors: membership.errors.full_messages}, status: :unprocessable_entity
        end
    end



    private

    def membership_params 
        params.permit(:gym_id, :client_id, :charge)
    end
        
end
