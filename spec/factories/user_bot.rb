FactoryBot.define do
  factory :user do
    name { "Aname" }
    email { "blank@blank.com" }
    password { "eightcharacters" }
  end
end