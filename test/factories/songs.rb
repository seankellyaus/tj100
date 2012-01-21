# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :song do
    sequence(:name) {|n| "Song #{n}"}
  end
end
