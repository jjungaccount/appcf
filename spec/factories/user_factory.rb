
FactoryGirl.define do 
  sequence(:email) { |n| "user{n}@example.com" }
  factory :user do
    email 
    password "testtest"
    first_name "Joe"
    last_name "Guy"
    admin false
  end   
  factory :admin do
    email 
    password "testtest"
    first_name "Admin"
    last_name "Admin"
    admin true
  end
end