namespace :balance do
  task create_balance: :environment do
    if Balance.last.nil?
      balance = Balance.create!(total_amount: 0)
      puts "=========BAlance============"
      puts balance
    else
      puts "Balance it was created"
    end
  end
end
