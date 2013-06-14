FactoryGirl.define do
  factory :broadcast do
    #creator
    title 'Some broadcast'
    content 'Some broadcast content'
    start_at nil
    end_at nil
    #viewings_count 0
    #hidden_viewings_count 0
    #impressions 0
  end
end