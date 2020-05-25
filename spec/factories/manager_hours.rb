FactoryBot.define do
  factory :manager_hour do
    email {"admin@example.com"}
    available_hours {20}
    allocated_hours {10}
    holiday_hours {6}
    spare_hours {4}
    year {2020}
    month {01}
  end
end
