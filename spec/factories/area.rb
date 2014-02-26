FactoryGirl.define do
  factory :area do
    title { Faker::Address.neighborhood}
    subtitle { "#{title} in " + Faker::Address.city}
    path { "#{title.gsub(" ", "-")}".downcase}
    boundary_encoded_points_string { Faker::Lorem.words(4).join("")}
    level [1, 2, 3, 4].sample
    sequence(:se_id) {|n| n}
    se_parent_id [1, 2, 3, 4].sample
  end
end