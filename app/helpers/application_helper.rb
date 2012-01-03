module ApplicationHelper
  #return a title on a per page basis
  def title
    base_title = "myFarm - small farmer App"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def logo
    image_tag("logo.png", :alt => "My Farm", :class => "round")
  end
  

  
end
