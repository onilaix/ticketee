FactoryGirl.define do
  factory :user do 
    name "John"
    password "this is a password"
    password_confirmation "this is a password"
  end
end