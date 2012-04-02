class Comment < ActiveRecord::Base
  
  attr_accessible :micropost_id, :user_id, :comment  
  

  belongs_to :Micropost
  has_many :users

 
  	     validates_presence_of :comment
  
end
