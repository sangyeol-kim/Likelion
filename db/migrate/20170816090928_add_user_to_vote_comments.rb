class AddUserToVoteComments < ActiveRecord::Migration[5.1]
  def change
      add_reference :vote_comments, :user, foreign_key: true
  end
end
