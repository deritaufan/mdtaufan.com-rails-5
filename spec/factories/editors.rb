FactoryGirl.define do
  factory :editor do
  	pwd = Faker::Internet.password
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { pwd }
    password_confirmation { pwd }
  end
end
