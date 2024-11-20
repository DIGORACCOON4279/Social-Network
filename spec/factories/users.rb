
# ./spec/factories/users.rb
FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    password { Faker::Internet.password(min_length: 6, max_length: 16) }
    name { Faker::Name.name }
  end
end
