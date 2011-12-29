# == Schema Information
# Schema version: 20110607170710
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  #virtual attributes
   #acts_as_reportable
  
  attr_accessor :password, :password_confirmation
  
  attr_accessible :name, :email, :password, :password_confirmation, :security_question, :security_answer,:party_id
  
  has_many :microposts, :dependent => :destroy
  
  #followed relationships
  has_many :relationships, :foreign_key => "follower_id",
                           :dependent => :destroy
  has_many :following, :through => :relationships, :source => :followed
  
  #follower relationsnips
  has_many :reverse_relationships, :foreign_key => "followed_id",
                                   :class_name => "Relationship",
                                   :dependent => :destroy
  has_many :followers, :through => :reverse_relationships, :source => :follower
  
  has_one :party
  has_many :Farms

  
 
  
                           
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates(:name, :presence => true)
  validates(:name, :length => { :maximum => 50 } )
  
  validates(:email, :presence => true)
  validates(:email, :format => { :with => email_regex } )
  validates(:email, :uniqueness => { :case_sensitive => false })
 # validates(:password, :presence   => true,
 #                      :confirmation => true,
#                      :length   => { :within => 6..40 })
  validates(:security_question, :presence => true)
  validates(:security_answer, :presence => true)
                       
  before_save :encrypt_password
  

  
  def has_password?(submitted_password)
    if encrypted_password == encrypt(submitted_password)
      return true
    else
      return false
    end             
  end
  
  def self.authenticate(email, submitted_password)
    user = find_by_email(email)

    return nil if user.nil?
    if user.has_password?(submitted_password)
      return user 
    else
      return nil
    end
        
  end
  
  def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    (user && user.salt == cookie_salt) ? user : nil
    #return nil if user.nil?
    #return user if user.salt == cookie_salt
  end
  
  def feed
    #Micropost.where("user_id = ?", id)
    Micropost.from_users_followed_by(self)
  end
  
  def following?(followed)
    relationships.find_by_followed_id(followed)
  end

  
  def follow!(followed)
    relationships.create!(:followed_id => followed.id)
  end
  
  def unfollow!(followed)
   relationships.find_by_followed_id(followed).destroy
  end
  
  
  
  private
    def encrypt_password
        self.salt = make_salt if new_record?
        self.encrypted_password = encrypt(password)
    end
    
    def encrypt(string)
      secure_hash("#{salt}--#{string}")

    end
    
    def make_salt
        secure_hash("#{Time.now.utc}--#{password}")
    end
    
    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end
    
    
    
  
end
