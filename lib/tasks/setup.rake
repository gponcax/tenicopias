namespace :setup do
  task create_wallet: :environment do
    Student.all.map {|s| s.create_wallet; puts "Wallet Created"}
  end
  task dummy_data: :environment do
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

puts "===========PRINTE=========="

printer=  Printer.create!({
                      name: Faker::Name.name,
                      email: Faker::Internet.email,
                      password: 'welcome123'
                    })
puts "===========PRINTE=========="
puts printer

puts "===========TEACHER1=========="
teacher1=  Teacher.create!({
                name: Faker::Name.name,
                email: Faker::Internet.email,
                phone: Faker::PhoneNumber.phone_number,
                password: 'welcome123'
              })

puts "===========TEACHER1=========="
puts teacher1

puts "===========TEACHER1 COURSES=========="
teacher1_course1=  teacher1.courses.create!({
                    name: Faker::Educator.course,
                    description: Faker::Educator.campus,
                    teacher_id: teacher1.id
              })

teacher1_course2=  teacher1.courses.create!({
                    name: Faker::Educator.course,
                    description: Faker::Educator.campus,
                    teacher_id: teacher1.id
              })
puts "===========TEACHER1 COURSES=========="




puts "===========TEACHER2========="
teacher2=  Teacher.create!({
                name: Faker::Name.name,
                email: Faker::Internet.email,
                phone: Faker::PhoneNumber.phone_number,
                password: 'welcome123'
              })

puts "===========TEACHER2========="
puts teacher2


puts "===========TEACHER1 COURSES=========="
teacher2_course1=  teacher2.courses.create!({
                    name: Faker::Educator.course,
                    description: Faker::Educator.campus,
                    teacher_id: teacher2.id
              })

teacher2_course2=  teacher2.courses.create!({
                    name: Faker::Educator.course,
                    description: Faker::Educator.campus,
                    teacher_id: teacher2.id
              })
puts "===========TEACHER1 COURSES=========="

puts "===========STUDENT1========="
student1= Student.create!({
                    name: Faker::Name.name,
                    email: Faker::Internet.email,
                    phone: Faker::PhoneNumber.phone_number,
                    password: 'welcome123',
                    birthdate: Faker::Date.birthday(18, 65),
                    gender: Faker::Boolean.boolean(0.2),
                    avatar: Faker::Avatar.image("my-own-slug", "50x50"),
                    school_id: 1
                  })

puts "===========STUDENT1=========="
puts student1

puts "===========STUDENT2========="
student2= Student.create!({
                    name: Faker::Name.name,
                    email: Faker::Internet.email,
                    phone: Faker::PhoneNumber.phone_number,
                    password: 'welcome123',
                    birthdate: Faker::Date.birthday(18, 65),
                    gender: Faker::Boolean.boolean(0.2),
                    avatar: Faker::Avatar.image("my-own-slug", "50x50") #=> "https://robohash.org/my-own-slug.png?size=50x50"
                  })

puts "===========STUDENT2=========="
puts student2


puts "===========STUDENT3========="
student3= Student.create!({
                    name: Faker::Name.name,
                    email: Faker::Internet.email,
                    phone: Faker::PhoneNumber.phone_number,
                    password: 'welcome123',
                    birthdate: Faker::Date.birthday(18, 65),
                    gender: Faker::Boolean.boolean(0.2),
                    avatar: Faker::Avatar.image("my-own-slug", "50x50") #=> "https://robohash.org/my-own-slug.png?size=50x50"
                  })

puts "===========student3=========="
puts student3

school = School.create(name: "Ing. Sistemas", date: Date.now)

school.groups.create!({
          name: Faker::Educator.course,
          description: Faker::Educator.campus,
          year: Time.now.year,
          semester: 1
          })




puts "===========GROUPS============"
group1 = student1.groups.create!({
          name: Faker::Educator.course,
          description: Faker::Educator.campus,
          course_id: teacher1_course1.id
          })

group2 = student1.groups.create!({
          name: Faker::Educator.course,
          description: Faker::Educator.campus,
          course_id: teacher1_course2.id
          })
puts "===========GROUPs=========="

puts "===========GROUPS============"
group1 = student1.groups.create!({
          name: Faker::Educator.course,
          description: Faker::Educator.campus,
          course_id: teacher2_course1.id
          })

group2 = student1.groups.create!({
          name: Faker::Educator.course,
          description: Faker::Educator.campus,
          course_id: teacher2_course2.id
          })
puts "===========GROUPs=========="

group3 = student2.groups.create!({
          name: Faker::Educator.course,
          description: Faker::Educator.campus,
          course_id: teacher1_course1.id
          })
puts "===========GROUPs=========="

  end
end
