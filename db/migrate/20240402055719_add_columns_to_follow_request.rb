class AddColumnsToFollowRequest < ActiveRecord::Migration[7.1]
  def change
    add_column :follow_requests, :sender_id, :integer
    add_column :follow_requests, :receiver_id, :integer
    add_column :follow_requests, :accepted, :boolean, default: false
  end
end
