class Micropost < ActiveRecord::Base
  #acts_as_reportable
  attr_accessible :content, :microphoto, :microphoto_file_name, :microphoto_content_type, 
  :microphoto_file_size, :microphoto_updated_at
  belongs_to :user
  has_many :comments, :dependent => :destroy
  
  has_attached_file :microphoto, :styles => { :large=> "500x500>", :medium => "260x300>",  :small => "220x260>", :thumb => "120x120>" }
 
  
  validates(:content, :presence => true, :length => { :maximum => 140 })
  validates(:user_id, :presence => true)
  
  default_scope :order => 'microposts.created_at DESC'
  # return microposts from the users being followed by the given user
  scope :from_users_followed_by, lambda { |user| followed_by (user)}
  
  
  private
  
  #Return an SQL condition for users followed by the given user
  #We include the users own id as well
  def self.followed_by(user)
    #followed_ids = user.following.map(&:id).join(", ")
    followed_ids = %(Select followed_id FROM relationships where follower_id = :user_id)
    where("user_id IN (#{followed_ids}) OR user_id = :user_id",  { :user_id => user })
   
  end

end

