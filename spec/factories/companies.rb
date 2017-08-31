FactoryGirl.define do
  factory :company do
    sequence :name do |n|
      "company#{n}"
    end
  end
end
