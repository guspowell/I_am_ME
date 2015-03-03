FactoryGirl.define do 
  factory :event do 
    name "Football"
    date DateTime.now
    description "FOOOOTBBBAAAALLLLL"
    location "Hyde Park"

  end
  
  factory :event_with_tag, parent: :event do
    ignore do 
      tag{create(:tag)}
    end
    after_create do |event, evaluator|
      event.tags << evaluator
    end 
  end

end
