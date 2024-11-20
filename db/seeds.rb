
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


User.create(name: "Juan Pérez", email: "juan.perez@example.com", password: "password", password_confirmation: "password")
User.create(name: "Ana García", email: "ana.garcia@example.com", password: "password", password_confirmation: "password")
User.create(name: "Carlos López", email: "carlos.lopez@example.com", password: "password", password_confirmation: "password")
User.create(name: "Mario Benedetto", email: "mario.beneddetto@example.com", password: "password", password_confirmation: "password")
user5 = User.new(name: "Marcos", email: "marcos@mail.com", password: "123456")
user5.save
# if user5.save
#   puts "Usuario guardado correctamente."
# else
#   puts "Error al guardar el usuario: #{user5.errors.full_messages}"
# end
User.create([
  { email: "user1@example.com", password: "password123", name: "User One" },
  { email: "user2@example.com", password: "password123", name: "User Two" },
  { email: "user3@example.com", password: "password123", name: "User Three" }
])
