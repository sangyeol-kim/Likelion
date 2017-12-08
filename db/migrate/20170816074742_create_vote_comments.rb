class CreateVoteComments < ActiveRecord::Migration[5.1]
  def change
    create_table :vote_comments do |t|
      t.references :link, foreign_key: true
      t.string :user_names
      t.text :body

      t.timestamps
    end
  end
end
