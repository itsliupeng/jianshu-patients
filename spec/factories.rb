# don't edit deliberately
FactoryGirl.define do

  factory :patient do
    first_name "Peng"
    middle_name "Da"
    last_name "Liu"
    sequence(:medical_record_number) {|n| n}
    date_of_birth {10.years.ago.to_date}
    gender "Male"
    status "Initial"
    viewed_count 1
    is_deleted false
    location  {build_stubbed :location}
  end

  factory :location do
    name "HZ"
    code "1"
  end
end
