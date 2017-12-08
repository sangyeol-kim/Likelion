class User < ApplicationRecord
  after_create :assign_default_role
  # 검색엔진
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  
  paginates_per 6
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  acts_as_reader
  acts_as_voter
  has_many :vote_comments
  has_many :links
  has_many :posts
  has_many :bulletins
  has_many :goods
  has_many :gooded_posts, through: :goods, source: :post
  #User에서 liked_posts를 가져오는데 이건 likes를 베이스로 가져오고
  #post인 애들만 보여준다
  has_many :reports
  has_many :reported_posts, through: :reports, source: :post
  
  has_many :comments
  has_many :notifications
  
  def is_good?(post)
    Good.find_by(user_id: self.id, post_id: post.id).present?
  end
  
  def is_report?(post)
    Report.find_by(user_id: self.id, post_id: post.id).present?
  end

  def assign_default_role
    add_role(:student)
  end

  # 닉네임 중복검사
  validates_uniqueness_of :nickname
  
  # 채팅 by Sy 180815
  def name
    email.split('@')[0]
  end
  
  has_many :authored_conversations, class_name: 'Conversation', foreign_key: 'author_id'
  has_many :received_conversations, class_name: 'Conversation', foreign_key: 'received_id'
  has_many :personal_messages, dependent: :destroy

  def online?
    !Redis.new.get("user_#{self.id}_online").nil?
  end

end
