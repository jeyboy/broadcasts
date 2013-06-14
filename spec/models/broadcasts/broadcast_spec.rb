require 'spec_helper'

describe Broadcasts::Broadcast do
  describe 'live scope' do
    before(:all) do
      @nil_dates_broadcast = create(:broadcast)
      @invalid_start_dates_broadcast = create(:broadcast, start_at: 2.minutes.ago)
      @valid_start_dates_broadcast = FactoryGirl.create(:broadcast, start_at: 2.minutes.from_now)
      @valid_end_dates_broadcast = FactoryGirl.create(:broadcast, end_at: 2.hours.from_now)
      @invalid_end_dates_broadcast = FactoryGirl.create(:broadcast, end_at: 2.hours.ago)
      @valid_both_dates_broadcasts = FactoryGirl.create(:broadcast, start_at: 2.minutes.ago, end_at: 2.hours.from_now)
      @invalid_both_dates_broadcasts = FactoryGirl.create(:broadcast, start_at: 2.hours.ago, end_at: 1.hours.ago)
    end

    before { @broadcasts = Broadcasts::Broadcast.live(6) }

    it 'must include only valid entries' do
      @broadcasts.should include(
                             @nil_dates_broadcast,
                             @valid_start_dates_broadcast,
                             @valid_end_dates_broadcast,
                             @valid_both_dates_broadcasts
                         )
    end

    it 'must not include invalid entries' do
      @broadcasts.should_not include(
                                 @invalid_start_dates_broadcast,
                                 @invalid_end_dates_broadcast,
                                 @invalid_both_dates_broadcasts
                             )
    end
  end

  describe 'broadcast list' do
    describe 'valid' do
      it 'must use default count' do

      end

      it 'must update impressions' do

      end
    end

    describe 'invalid' do
      it 'not set viewer' do

      end
    end
  end
end


class Broadcasts::Broadcast < ActiveRecord::Base
  scope :live, ->(limit) {where('(:current_date >= start_at OR start_at IS NULL) AND (end_at > :current_date OR end_at IS NULL)', current_date: Time.zone.now).limit(limit)}

  def self.broadcast_list(viewer_user, count = 5)
    raise Exception.new('Viewer not set') unless viewer_user
    broadcasts = self.live(count)
    broadcasts.each do |broadcast|
      viewing = broadcast.viewings.where(
          viewer_id: viewer_user.id,
          viewer_type: viewer_user.class.name).first_or_initialize
      viewing.impressions += 1
      viewing.save
    end
    broadcasts
  end
end
