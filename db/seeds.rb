admin = User.create(email: 'admin@sellito.pl', password: 'password', is_admin?: true)
user = User.create(email: 'klient@sellito.pl', password: 'password')
categories = %w(home fashion garden beauty kids edu food moto it health hobby sport pets music others)
categories.each { |category| Category.create(name: category) }

20.times do |i|
  admin.posts.create(title: "Admin post #{i}", expiration_date: Time.now)
  user.posts.create(title: "User post #{i}", expiration_date: Time.now)
end

Post.all.each { |p| p.categories << Category.all.sample }
