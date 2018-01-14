namespace :setup do
  task create_dummy_data: :environment do
    admin = Admin.create!({
                    name: Faker::Name.name,
                    email: 'admintest@test.com',
                    phone: Faker::PhoneNumber.phone_number,
                    password: 'welcome123'
                  }) unless Admin.nil?

puts "===========ADMIN=========="
puts admin
      teacher=  Teacher.create!({
                      name: Faker::Name.name,
                      email: Faker::Internet.email,
                      phone: Faker::PhoneNumber.phone_number,
                      password: 'welcome123'
                    })

puts "===========TEACHER=========="
puts teacher
      printer=  Printer.create!({
                      name: Faker::Name.name,
                      email: Faker::Internet.email,
                      password: 'welcome123'
                    })

puts "===========PRINTER=========="
puts printer

    student= Student.create!({
                    name: Faker::Name.name,
                    email: Faker::Internet.email,
                    phone: Faker::PhoneNumber.phone_number,
                    password: 'welcome123',
                    birthdate: Faker::Date.birthday(18, 65),
                    gender: Faker::Boolean.boolean(0.2)
                  })

puts "===========STUDENT=========="
puts student
      group = student.groups.create!({
          name: Faker::Educator.course,
          description: Faker::Educator.campus,
          teacher_id: teacher.id
          })

puts "===========GROUP=========="
puts group
    course = group.courses.create!({
                    name: Faker::Educator.course,
                    description: Faker::Educator.campus,
                    teacher_id: teacher.id,
                    student_id: student.id
                      })
puts "===========COURSE=========="
puts course

  end
end
