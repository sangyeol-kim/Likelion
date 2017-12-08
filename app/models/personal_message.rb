class PersonalMessage < ApplicationRecord
  validates :body, presence: true
  belongs_to :conversation
  belongs_to :user
  
  after_create_commit do
    conversation.touch
    AlarmBroadcastJob.perform_later(self)
  end
  
  def receiver
    if conversation.author == conversation.receiver || conversation.receiver == user
      conversation.author
    else
      conversation.receiver
    end
  end
end
