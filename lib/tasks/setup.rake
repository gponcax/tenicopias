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
                  })?
    end
  end
end
