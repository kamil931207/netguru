User.create(email: 'admin@sellito.pl', password: 'password', is_admin?: true)
User.create(email: 'klient@sellito.pl', password: 'password')
categories = %w(home fashion garden beauty kids edu food moto it health hobby sport pets music others)
categories.each { |category| Category.create(name: category) }
