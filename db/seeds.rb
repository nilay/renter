# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

UnitType.create({ name: 'Studio', description: 'Studio' })
UnitType.create({ name: '1 Bed Room Appt', description: '1 Bed Room Appt'})
UnitType.create({ name: '2 Bed Room Appt', description: '2 Bed Room Appt'})
UnitType.create({ name: 'Duplex', description: 'Duplex' })

UnitType.all.each do |ut|
  10.times do |index|
    ut.units.create({
                      unit_no: "Unit#{ut.id}#{index}",
                      monthly_rental_amount: rand(1200..70000),
                      sql_meter: rand(850..2000),
                      status: :vacant,
                      year_built: rand(1990..2021).to_s
                    })
  end
end

User.role.values.each do |role|
  10.times do |index|
    User.create({
                  first_name: Faker::Name.first_name,
                  last_name: Faker::Name.last_name,
                  email: "#{role}#{index}@renter.com",
                  password: 'password',
                  role: role
                })
  end
end

10.times do |index|
  LeaseGenerator.call({
                 unit: Unit.with_status(:vacant).order('RAND()').first,
                 renter: User.with_role(:renter).order('RAND()').first,
                 leased_by: User.with_role(:manager).order('RAND()').first,
                 from_date: "#{rand(2018..2022)}-#{rand(1..12)}-#{rand(1..28)}",
                 to_date: "#{rand(2023..2025)}-#{rand(1..12)}-#{rand(1..28)}"
               })
end

20.times do |index|
  Appointment.create({
                       unit: Unit.with_status(:vacant).order('RAND()').first,
                       user: User.with_role(:renter).order('RAND()').first,
                       datetime: Time.now + rand(7..18).day,
                       note: Faker::Quotes::Rajnikanth.joke
                     })
end
