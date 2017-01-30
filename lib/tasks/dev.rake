namespace :dev do
  desc "Desenvolve o setup do Escambo App"
  task setup: :environment do
    puts "Setup iniciado\n\n"
    puts %x(rm -rf #{Rails.root.join('public', 'system')})
    puts %x(rails db:drop)
    puts %x(rails db:create)
    puts %x(rails db:migrate)
    puts %x(rails db:seed)
    puts %x(rails dev:generate_members)
    puts %x(rails dev:generate_ads)
    puts "\n\nSetup executado com sucesso!"
  end



##################################################
  desc "Cria MEMBROS Fake"
  task generate_members: :environment do

    puts "Creating members"

    10.times do
      Member.create!(
        email: Faker::Internet.email,
        password: "123456",
        password_confirmation: "123456"
      )
    end

    puts "MEMBERS successfully created!"
  end


##################################################
  desc "Create Fake ADs"
  task generate_ads: :environment do


    puts "Creating ADs"
    2.times do
      Ad.create!(
        title: Faker::Lorem.sentence([2,3,4,5].sample),
        description_short: Faker::Lorem.sentence(1),
        description_md: DoctorIpsum::Markdown.entry,
        member: Member.first,
        category: Category.all.sample,
        price: "#{Random.rand(500)}.#{Random.rand(99)}",
        finish_date: Date.today + Random.rand(90),
        picture: File.new(Rails.root.join('public', 'templates', 'images-for-ads', "#{Random.rand(9)}.jpg"), 'r')
      )
    end


    10.times do
      Ad.create!(
        title: Faker::Lorem.sentence([2,3,4,5].sample),
        description_short: Faker::Lorem.sentence(1),
        description_md: DoctorIpsum::Markdown.entry,
        member: Member.all.sample,
        category: Category.all.sample,
        price: "#{Random.rand(500)}.#{Random.rand(99)}",
        finish_date: Date.today + Random.rand(90),
        picture: File.new(Rails.root.join('public', 'templates', 'images-for-ads', "#{Random.rand(9)}.jpg"), 'r')
      )
    end

    puts "ADs successfully created!"
  end

end
