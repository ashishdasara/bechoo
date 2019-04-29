puts "Seeding Database..."

admin = User.create!(first_name: 'admin', last_name: 'admin', email: 'admin@gmail.com', username: 'adminuser', password: 'password', password_confirmation: 'password', admin: 'true', location: 'kolkata')

u1 = User.create!(first_name: 'user', last_name: 'first', email: 'userfirst@gmail.com', username: 'firstuser', password: 'password', password_confirmation: 'password', admin: 'false', location: 'kolkata')

u2 = User.create!(first_name: 'user', last_name: 'second', email: 'usersecond@gmail.com', username: 'seconduser', password: 'password', password_confirmation: 'password', admin: 'false', location: 'kolkata')

cat1 = Category.create!(name: 'automobiles')
cat2 = Category.create!(name: 'fashion')

sub_cat1 = cat1.sub_categories.create!(name: 'bikes')
sub_cat2 = cat1.sub_categories.create!(name: 'cars')
