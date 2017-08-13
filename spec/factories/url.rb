FactoryGirl.define do
  factory :url do
    sequence(:original) do |n|
      "https://www.example.com/#{"%.3i" %n}"
    end
  end
end
