module ApplicationHelper
  #return a title on a per page basis
  def title
    base_title = "iFarmService - farm mgt"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def logo
    image_tag("logo.png", :alt => "iFarmService", :class => "round")
  end
  

  
end
