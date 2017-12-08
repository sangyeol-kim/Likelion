class Notification < ApplicationRecord
  belongs_to :user
  acts_as_readable on: :created_at
end
