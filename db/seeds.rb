# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Location.create([
                {name: "Test location 1", code: "001"},
                {name: "Test location 2", code: "002"}
])

# Patient.create([
#   {first_name: "鹏", middle_name: "", last_name: "刘", medical_record_number: 1, date_of_birth:
#     2.years.ago.to_date,  gender: "Male",  status: "Initial", location_id: 1},
#   {first_name: "安", middle_name: "文", last_name: "白", medical_record_number: 2, date_of_birth:
#     10.years.ago.to_date,  gender: "Male",  status: "Treatment", location_id: 1},
#   {first_name: "Huan", middle_name: "Ze", last_name: "Jin", medical_record_number: 3, date_of_birth:
#     15.years.ago.to_date,  gender: "Male",  status: "Referred", location_id: 1},
#   {first_name: "Man", middle_name: "Da", last_name: "Ren", medical_record_number: 4, date_of_birth:
#     1.year.ago.to_date,  gender: "Male",  status: "Referred", location_id: 2},
#   {first_name: "Guo", middle_name: "Bi", last_name: "Ting", medical_record_number: 5, date_of_birth:
#     30.years.ago.to_date,  gender: "Female",  status: "Closed", location_id: 2}
# ])
