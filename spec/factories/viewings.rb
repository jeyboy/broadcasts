FactoryGirl.define do
  factory :viewing, class: 'Broadcasts::Viewing' do
    broadcast
    hidden_at nil
    impressions 0
  end
end