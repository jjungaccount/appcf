
FactoryGirl.define do 
  sequence(:email) { |n| "user{n}@example.com" }
  factory :user do
    email 
    password "testtest3"
    first_name "Joe"
    last_name "Person"
    admin false
  end   
  factory :admin, class: User do
    email 
    password "testtest2"
    first_name "Admin"
    last_name "Admin"
    admin true
  end
end