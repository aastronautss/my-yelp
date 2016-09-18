Fabricator :business do
  name { Faker::Lorem.words(rand 1..5).join ' ' }
  address { Faker::Address.street_address }
  city { Faker::Address.city }
  state { Faker::Address.state }
  zip { Faker::Address.zip }
  phone do
    Faker::Config.locale = 'en-US'
    Faker::PhoneNumber.phone_number
  end
  website_url { Faker::Internet.url }
  description { Faker::Lorem.paragraphs(rand 1..3).join "\n\n" }
  summary { Faker::Lorem.paragraph  }
end
