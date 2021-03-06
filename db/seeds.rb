# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Creating the CATEGORIES...\n\n"
categories = ["Animais e acessórios",
	"Esportes",
	"Para a sua casa",
	"Eletrônicos e celulares",
	"Música e hobbies",
	"Bebês e crianças",
	"Moda e beleza",
	"Veículos e barcos",
	"Imóveis",
	"Empregos e negócios"]

	categories.each do |f|
		puts "Categoria \"#{f}\" criada!"
		Category.friendly.find_or_create_by!(description: f)
	end
	puts 
	puts "CATEGORIES successfully created!"
	puts

#### Admin ####
puts "Creating new ADMIN (admin@admin.com) - (123456)"
Admin.create!(name: "God",
							email: "admin@admin.com", 
							password: "123456",
							password_confirmation: "123456",
							role: 0)

puts "ADMIN successfully created!"



#### Member ####
puts "Creating new MEMBER (member@member.com) - (123456)"
Member.create!(email: "member@member.com", 
							password: "123456",
							password_confirmation: "123456")

puts "MEMBER successfully created!"