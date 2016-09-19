User.create email: 'tyler@example.com', password: 'tyler', first_name: 'Tyler', last_name: 'Guillen'

20.times { Fabricate :user }

100.times { Fabricate :business }

1000.times { Fabricate :review }
