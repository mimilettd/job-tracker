FactoryGirl.define do
  factory :job do
    sequence :title do |n|
      "job#{n}"
    end
    sequence :description do |n|
      "Uses Ruby and Javascript#{n}"
    end
    sequence :level_of_interest do |n|
      n
    end
    sequence :city do |n|
      "Portland#{n}"
    end
    company
    category
  end
end
