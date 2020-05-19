class Study < ApplicationRecord
  validates :study_name, presence: true

  #gets the tasks related to the study from table - id from study's row
  def get_rel_task(arg)
    redirect_to(study_task(StudyTask.find(arg.id)))
  end


end
