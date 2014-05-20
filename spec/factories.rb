FactoryGirl.define do
  factory :user do
    email                   "tester@example.com"
    password                "foobarbaz"
    password_confirmation   "foobarbaz"
  end
end
