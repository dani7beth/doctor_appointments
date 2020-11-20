# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = []
doctors = []
 User.destroy_all

20.times do |i|
    users << User.create(name: Faker::FunnyName.two_word_name)
end

5.times do |i|
  doctors << Doctor.create(name: Faker::Science.scientist)
end

doctors.each do |doctor|
    7.times do #lets make each doctor have 7 patients
        doctor.appointments.create(appointment_date: Faker::Date.between(from:'2020-11-19', to:'2021-11-19'),
                                   doctor_id: doctors.sample.id,
                                   user_id: users.sample.id)
    end
end