Fabricator :business do
  name { Faker::Lorem.words(rand 1..5).join ' ' }
  address { Faker::Address.street_address }
  city { Faker::Address.city }
  state { Faker::Address.state }
  zip { Faker::Address.zip }
  website_url { Faker::Internet.url }
end
