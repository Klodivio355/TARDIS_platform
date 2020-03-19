class Study < ApplicationRecord
  validates :study_name, presence: true
  has_many :task_lists


  def get_rel_task(arg)
    redirect_to(study_task(StudyTask.find(arg.id)))
  end


end
