class Membership < ApplicationRecord
    validates :client_id, uniqueness: true
end
