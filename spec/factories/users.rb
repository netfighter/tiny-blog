FactoryBot.define do
  sequence :email do |n|
    "user#{n}@example.com"
  end

  sequence :first_name do |n|
    "Ludovic #{n}"
  end

  factory :user do
    first_name
    last_name { 'The Great' }
    email
    password { 'averysecretone' }
    password_confirmation { 'averysecretone' }
    # required if the Devise Confirmable module is used
    confirmed_at { Time.now }

    after(:create) { |user| user.add_role(:user) }

    factory :admin do
      after(:create) do |user|
        user.email = 'admin@example.net'
        user.add_role(:admin)
      end
    end
  end
end
