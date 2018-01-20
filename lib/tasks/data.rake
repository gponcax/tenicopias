namespace :data do
  task create_dummy_data: :environment do
    if Admin.last.nil?
      admin = Admin.create!({
                    name: Faker::Name.name,
                    email: 'admintest@test.com',
                    phone: Faker::PhoneNumber.phone_number,
                    password: 'welcome123'
                  }) unless Admin.nil?
    end
puts "===========ADMIN=========="
puts admin


teacher1=  Teacher.create!({
                name: Faker::Name.name,
                email: Faker::Internet.email,
                phone: Faker::PhoneNumber.phone_number,
                password: 'welcome123'
              })

puts "===========TEACHER1=========="
puts teacher1
#
# teacher2=  Teacher.create!({
#                 name: Faker::Name.name,
#                 email: Faker::Internet.email,
#                 phone: Faker::PhoneNumber.phone_number,
#                 password: 'welcome123'
#               })
#
# puts "===========TEACHER2========="
# puts teacher2
#
# teacher3=  Teacher.create!({
#                 name: Faker::Name.name,
#                 email: Faker::Internet.email,
#                 phone: Faker::PhoneNumber.phone_number,
#                 password: 'welcome123'
#               })
#
# puts "===========TEACHER3=========="
# puts teacher3
#
# teacher4=  Teacher.create!({
#                 name: Faker::Name.name,
#                 email: Faker::Internet.email,
#                 phone: Faker::PhoneNumber.phone_number,
#                 password: 'welcome123'
#               })
#
# puts "===========TEACHER4=========="
# puts teacher4

printer=  Printer.create!({
                      name: Faker::Name.name,
                      email: Faker::Internet.email,
                      password: 'welcome123'
                    })
puts "===========PRINTE=========="
puts printer

student1= Student.create!({
                    name: Faker::Name.name,
                    email: Faker::Internet.email,
                    phone: Faker::PhoneNumber.phone_number,
                    password: 'welcome123',
                    birthdate: Faker::Date.birthday(18, 65),
                    gender: Faker::Boolean.boolean(0.2),
                    avatar: Faker::Avatar.image("my-own-slug", "50x50") #=> "https://robohash.org/my-own-slug.png?size=50x50"
                  })

puts "===========STUDENT=========="
puts student1
puts "===========STUDENT=========="

course = group.courses.create!({
                name: Faker::Educator.course,
                description: Faker::Educator.campus,
                teacher_id: teacher1.id,
                student_id: student1.id
                  })
puts "===========COURSE=========="

study_klass = student1.study_klasses.create!({
          name: Faker::Educator.course,
          description: Faker::Educator.campus,
          teacher_id: teacher1.id
          })

puts "===========GROUP=========="
puts group
#

# course = group.courses.create!({
#                 name: Faker::Educator.course,
#                 description: Faker::Educator.campus,
#                 teacher_id: teacher2.id,
#                 student_id: student1.id
#                   })
# puts "===========COURSE3=========="
# course = group.courses.create!({
#                 name: Faker::Educator.course,
#                 description: Faker::Educator.campus,
#                 teacher_id: teacher3.id,
#                 student_id: student1.id
#                   })
# puts "===========COURSE4=========="
# course = group.courses.create!({
#                 name: Faker::Educator.course,
#                 description: Faker::Educator.campus,
#                 teacher_id: teacher3.id,
#                 student_id: student1.id
#                   })
# puts "===========COURSE5=========="

  end
end
