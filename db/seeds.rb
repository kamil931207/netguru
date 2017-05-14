admin = User.create(email: 'admin@sellito.pl', password: 'password', is_admin?: true)
user = User.create(email: 'klient@sellito.pl', password: 'password')
categories = %w(home fashion garden beauty kids edu food moto it health hobby sport pets music others)
categories.each { |category| Category.create(name: category) }
admin_post_1 = admin.posts.create(title: "ADMIN_RAILS", description: "some description", expiration_date: Time.now + 2.weeks)
admin_post_2 = admin.posts.create(title: "ADMIN_RAILS2", expiration_date: Time.now + 3.weeks)
admin_post_3 = admin.posts.create(title: "ADMIN_RAILS3", expiration_date: Time.now + 4.weeks)
user_post_1 = user.posts.create(title: "USER_RAILS", description: "some description", expiration_date: Time.now + 2.weeks)
user_post_2 = user.posts.create(title: "USER_RAILS2", expiration_date: Time.now + 3.weeks)
user_post_3 = user.posts.create(title: "USER_RAILS3", expiration_date: Time.now + 4.weeks)
admin_post_1.categories << Category.first
user_post_1.categories << Category.second
admin_post_2.categories << Category.third
user_post_2.categories << Category.first
admin_post_3.categories << Category.second
user_post_3.categories << Category.third
admin_post_1.categories << Category.find(6)
user_post_1.categories << Category.find(7)
admin_post_2.categories << Category.find(8)
user_post_2.categories << Category.find_by(name: 'edu')
admin_post_3.categories << Category.find_by(name: 'others')
user_post_3.categories << Category.find(9)
