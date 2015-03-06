FactoryGirl.define do 
  factory :event do 
    name "Football"
    date DateTime.now.change({min: 00, hour: 12})
    description "FOOOOTBBBAAAALLLLL"
    location "Hyde Park"
  end
  
end
