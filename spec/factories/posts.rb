FactoryGirl.define do
  factory :post do
    title "MyString"
    content "Some post content..."

    after(:build) do |post|
      post.user = User.find_by_email('admin@example.net') || FactoryGirl.create(:admin)
    end
  end
end
