FactoryBot.define do
  sequence(:url) { |n| "http://url_#{n}.test" }
  sequence(:name) { |n| "name_#{n}" }
  sequence(:email) { |n| "number_#{n}@email.local" }
  sequence(:password) { |n| "w*Zxertg#{n}"}
end
