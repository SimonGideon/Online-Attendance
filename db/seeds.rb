# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds.rb
super_admin = Admin.find_or_initialize_by(email: 'superadmin@elimu.com')
super_admin.names = 'Otto_Admin'
super_admin.super_admin = true
super_admin.password = '123456'
super_admin.password_confirmation = '123456'
super_admin.save!
