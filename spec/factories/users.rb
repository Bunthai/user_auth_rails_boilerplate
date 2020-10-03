FactoryBot.define do
  factory :user, class: User do
    username { FFaker::Internet.user_name }
    password { FFaker::Internet.password }
  end
end
