FactoryGirl.define do
  factory :user do
    username                "Tester"
    email                   "tester@example.com"
    password                "foobarbaz"
    password_confirmation   "foobarbaz"
  end
end
