class Type < ActiveRecord::Base
 # acts_as_reportable
  attr_accessible :typename, :type_value_string, :type_value_integer, :type_boolean, :type_isprotected
    default_scope :order => 'types.typename'


    def self.get_terms_by_name(name, user_id)
     return Type.where('typename' => 'invoice_terms', 'type_value_string' => name, 'user_id' => user_id)  
    end 
 
end
