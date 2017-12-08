class AddDeletedAtToVoteComments < ActiveRecord::Migration[5.1]
  def change
    add_column :vote_comments, :deleted_at, :datetime
    add_index :vote_comments, :deleted_at
  end
end
