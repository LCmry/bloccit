FactoryGirl.define do
  factory :post do
    title "Post Title"
    body "Post bodies mst be pretty long."
    user
    topic { Topic.create(name: 'Topic name') }
  end
end