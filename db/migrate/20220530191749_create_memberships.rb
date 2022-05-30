class CreateMemberships < ActiveRecord::Migration[6.1]
  def change
    create_table :memberships do |t|
      t.gym_id :integer
      t.client_id :integer
      t.charge :integer

      t.timestamps
    end
  end
end
