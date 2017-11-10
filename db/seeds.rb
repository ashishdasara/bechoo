# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = User.create!(first_name: 'admin', last_name: 'admin', email: 'admin@gmail.com', username: 'adminadmin', password: 'password', password_confirmation: 'password', approved: 'true', admin: 'true', contact_no: 4587632109, location: 'kolkata')

u1 = User.create!(first_name: 'user', last_name: 'first', email: 'userfirst@gmail.com', username: 'userfirst', password: 'password', password_confirmation: 'password', approved: 'true', admin: 'false', contact_no: 4896541230, ;location: 'kolkata')

u2 = User.create!(first_name: 'user', last_name: 'second', email: 'usersecond@gmail.com', username: 'usersecond', password: 'password', password_confirmation: 'password', approved: 'false', admin: 'false', contact_no: 4896541231, ;location: 'kolkata')

cat1 = Category.create!(name: 'automobiles')
cat2 = Category.create!(name: 'fashion')

sub_cat1 = cat1.sub_categories.create!(name: 'bikes')
sub_cat2 = cat1.sub_categories.create!(name: 'cars')
