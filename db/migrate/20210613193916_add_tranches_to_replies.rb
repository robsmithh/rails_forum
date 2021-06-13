class AddTranchesToReplies < ActiveRecord::Migration[6.1]
  def change
    add_column :replies, :reply_of_reply, :boolean, default: false
    add_column :replies, :ror_id, :integer
  end
end
