class Post < ApplicationRecord
  after_destroy :log_destroy_action
  acts_as_paranoid
  paginates_per 20
  resourcify
  
  has_many :impressions, :as=>:impressionable
  has_many :comments, dependent: :destroy
  has_many :homes
  belongs_to :bulletin, optional: true
  belongs_to :user
  has_many :goods
  has_many :gooded_users, through: :goods, source: :user
  has_many :reports
  has_many :reported_users, through: :reports, source: :user
  
  def log_destroy_action
    puts 'Post destroyed'
  end
  
  def impression_count
    impressions.size
  end

  def unique_impression_count
    # impressions.group(:ip_address).size gives => {'127.0.0.1'=>9, '0.0.0.0'=>1}
    # so getting keys from the hash and calculating the number of keys
    impressions.group(:ip_address).size.keys.length #TESTED
  end
end
