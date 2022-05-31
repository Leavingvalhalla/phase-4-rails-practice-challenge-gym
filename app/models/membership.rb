class Membership < ApplicationRecord
    validate :unique_membership
    belongs_to :gym
    belongs_to :client

    def unique_membership
        client = Client.find(client_id)
        if client.memberships.find_by(gym_id: gym_id)
            errors.add(:gym_id, "Client can only have one membership to each gym")
        end
    end
end
