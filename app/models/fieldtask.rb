class Fieldtask < ActiveRecord::Base
   # acts_as_reportable
    attr_accessible :taskdescription, :task_type, :task_notes, :task_duration_days, :task_frequency_days , :task_stage
    belongs_to :Farmjob
    
     validates_presence_of :taskdescription, :task_type
     has_many :fieldtasksupplies
     has_many :supplies, :through => :fieldtasksupplies
     has_many :farmjobs
     default_scope :order => 'fieldtasks.task_type'
     
     def self.get_supplies_by_fieldtask_id(fieldtask_id)
       @fieldtask = Fieldtask.find_by_id(fieldtask_id)
       return @tasksupplies = @fieldtask.fieldtasksupplies.all 
     end
     
     def self.get_fieldtasks_by_type(user_id)
       
       return Fieldtask.find_by_sql("Select id, task_stage || ' - ' || taskdescription  as taskfull   
        from fieldtasks 
        where fieldtasks.user_id = #{user_id}
        order by task_stage desc")
     end
end
