Fabricator :review do
  rating { rand(1..5) }
  body { Faker::Lorem.paragraphs(rand 1..3).join "\n\n" }

  user { User.any? ? User.all.sample : Fabricate(:user) }
  business { Business.any? ? Business.all.sample : Fabricate(:business) }
end
