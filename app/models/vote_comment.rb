class VoteComment < ApplicationRecord
  acts_as_paranoid
  paginates_per 15
  validates :body, presence: true
  after_destroy :log_destroy_action
  resourcify
  
  belongs_to :link
  belongs_to :user
  
  def log_destroy_action
    puts 'Post destroyed'
  end
end
