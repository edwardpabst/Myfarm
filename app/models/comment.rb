class Comment < ActiveRecord::Base
  
  attr_accessible :micropost_id, :user_id, :comment  
  

  belongs_to :Micropost
  has_many :users

 
  	     validates_presence_of :comment
 
  
  def self.get_comments_by_micropost_id(id)
    

      @comments = Comment.find_by_sql("Select comment, comments.created_at, user_id, users.name, users.email
       from comments
       join users on comments.user_id = users.id
       where micropost_id = #{id} 
       order by comments.created_at desc")            


  end 
end
