require 'composite_primary_keys'


class StudyTask < ApplicationRecord
  self.primary_keys = :study_id, :year, :month, :task_name
end
