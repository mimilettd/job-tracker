FactoryGirl.define do
  factory :category do
    sequence :title do |n|
      "title#{n}"
    end
  end
end
