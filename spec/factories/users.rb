FactoryBot.define do
  factory :user do |record|
    username { generate :name }
    email { generate :email }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
