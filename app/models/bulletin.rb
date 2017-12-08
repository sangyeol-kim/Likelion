class Bulletin < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  
  acts_as_paranoid
  paginates_per 5
  resourcify

  has_many :impressions, :as=>:impressionable
  has_many :posts, dependent: :destroy
  has_many :homes
  belongs_to :user
  
  # 조회수 관련
  def impression_count
    impressions.size
  end

  # 조회수 관련
  def unique_impression_count
    # impressions.group(:ip_address).size gives => {'127.0.0.1'=>9, '0.0.0.0'=>1}
    # so getting keys from the hash and calculating the number of keys
    impressions.group(:ip_address).size.keys.length #TESTED
  end
end
