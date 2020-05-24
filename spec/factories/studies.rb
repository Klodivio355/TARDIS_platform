FactoryBot.define do
  factory :study do
    study_name {"Study 1"}
    stage {"post lock"}
    type_of {"Routine data"}
    notes {"description"}
    lead_manager {"admin@example.com"}
    backup_manager{"dm@example.com"}
    start_date {"01/01/2015"}
    lplv {"25/08/2023"}
    study_finished {false}
  end
end
