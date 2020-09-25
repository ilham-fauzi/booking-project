require 'date'

# specializations = [
#     'umum',
#     'special saraf',
#     'special kandungan',
#     'special penyakit',
#     'special bedah',
#     'special kulit',
# ]
# specializations.each do |s|
#     Specialization.create(name: s)
# end

# 10.times do
#     Doctor.create({
#         name: Faker::Name.unique.name,
#         specialization_id: rand(specializations.length)+1
#     })
#     Hospital.create({
#         name: Faker::Nation.nationality,
#         address: Faker::Nation.capital_city
#     })
# end

schedules = [
    {start: '08:00', end: '13:00'},
    {start: '08:00', end: '17:00'},
    {start: '10:00', end: '15:00'},
    {start: '08:00', end: '10:00'},
    {start: '13:00', end: '21:00'},
    {start: '15:00', end: '21:00'},
    {start: '13:00', end: '15:00'},
]
7.times do
    Schedule.create({
        doctor_id: rand(10)+1,
        hospital_id: rand(10)+1,
        day: Date::DAYNAMES[rand(7)],
        start_time: schedules[rand(schedules.length)][:start],
        end_time: schedules[rand(schedules.length)][:end]
    })
end

# 10.times do
#     User.create(
#         email: Faker::Internet.email,
#         password: BCrypt::Password.create('12345678'),
#         provider: ['google', 'github', 'facebook', 'twitter'].sample,
#         name: Faker::Name.unique.name,
#         uid: rand(8 ** 8)
#     )
# end

