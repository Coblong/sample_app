FactoryGirl.define do
  factory :user do
    name     "Jonny Bravo"
    email    "bravo@pretty.com"
    password "jonnyb"
    password_confirmation "jonnyb"
  end
end