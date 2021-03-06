FactoryGirl.define do
  factory :broadcast, class: 'Broadcasts::Broadcast' do
    creator {create(:admin_user)}
    title 'Some broadcast'
    content 'Some broadcast content'
    start_at nil
    end_at nil
  end
end