FactoryBot.define do
  factory :study_task do
    task_name {"Routine data"}
    study_id {1}
    year {2020}
    month {01}
    complete {false}
    lead_hours_worked {10}
    backup_hours_worked {20}
    guest_hours_worked {30}
  end
end
