namespace :setup do
  task create_test_admin: :environment do
    admin = Admin.create!({
                    name: Faker::Name.name,
                    email: 'admintest@test.com',
                    phone: Faker::PhoneNumber.phone_number,
                    password: 'welcome123'
                  }) unless Admin.nil?


      teacher=  Teacher.create!({
                      name: Faker::Name.name,
                      email: Faker::Internet.email,
                      phone: Faker::PhoneNumber.phone_number,
                      password: 'welcome123'
                    })

      printer=  Printer.create!({
                      name: Faker::Name.name,
                      email: Faker::Internet.email,
                      password: 'welcome123'
                    })

    student= Student.create!({
                    name: Faker::Name.name,
                    email: Faker::Internet.email,
                    phone: Faker::PhoneNumber.phone_number,
                    password: 'welcome123'
                  })

      group = student.groups.create!({
          name: Faker::Educator.course,
          description: Faker::Educator.campus,
          teacher_id: teacher.id
          })

    course = group.courses.create!({
                    name: Faker::Educator.course,
                    description: Faker::Educator.campus
                      })



  end
end
