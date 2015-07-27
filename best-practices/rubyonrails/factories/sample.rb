FactoryGirl.define do
  factory :comment do
    author 'Anonymous'
    body 'Great post, man!'
    approved_at Date.current

    factory :comment_with_post do
      post
    end
  end
  
  factory :invalid_comment do
    author nil
    body nil
    approved_at nil
  end

  factory :post do
    title 'New post'
  end

  trait :with_post do
    post
  end

  trait :with_comments do
    ignore do
      number_of_comments 3
    end

    after :create do |post, evaluator|
      FactoryGirl.create_list :comment, evaluator.number_of_comments, :post => post
    end
  end
end

# IRB> FactoryGirl.create :post, :with_comments, :number_of_comments => 4
# IRB> FactoryGirl.create :comment
# IRB> FactoryGirl.create :comment_with_post
# IRB> FactoryGirl.create :comment, :with_post
