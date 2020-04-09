class Study < ApplicationRecord
  validates :study_name, presence: true

  def get_rel_task(arg)
    redirect_to(study_task(StudyTask.find(arg.id)))
  end


end
