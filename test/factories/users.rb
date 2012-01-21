# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:name) {|n| "user_#{n}"}
    sequence(:email) {|n| "user_#{n}@example.com"}
    password "secret"
  end
end
