FactoryGirl.define do
  factory :user do
    username                "Tester"
    email                   "tester@example.com"
    password                "foobarbaz"
    password_confirmation   "foobarbaz"
  end

  factory :pin do
    equation                "x\; =\; \frac {-b\; \pm\; \sqrt {b^2\; -\; 4ac}}{2a}"
    description             "The quadratic formula"
    user
  end
end
