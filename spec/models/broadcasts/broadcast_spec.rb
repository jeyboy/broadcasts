require 'spec_helper'

describe Broadcasts::Broadcast do
  subject { Broadcasts::Broadcast }

  describe 'live scope' do
    before(:all) do
      @nil_dates_broadcast = create(:broadcast)
      @invalid_start_dates_broadcast = create(:broadcast, start_at: 2.minutes.ago)
      @valid_start_dates_broadcast = create(:broadcast, start_at: 2.minutes.from_now)
      @valid_end_dates_broadcast = create(:broadcast, end_at: 2.hours.from_now)
      @invalid_end_dates_broadcast = create(:broadcast, end_at: 2.hours.ago)
      @valid_both_dates_broadcasts = create(:broadcast, start_at: 2.minutes.ago, end_at: 2.hours.from_now)
      @invalid_both_dates_broadcasts = create(:broadcast, start_at: 2.hours.ago, end_at: 1.hours.ago)
    end

    before { @broadcasts = subject.live(6) }

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
    before { @user = create(:admin_user) }

    describe 'valid' do
      it 'must use default count' do
        expect(subject.broadcast_list(@user)).to_not raise_error
      end

      describe 'must update impressions' do
        it 'new viewing' do
          Viewing.count.should eql? 0
          @broadcasts = subject.broadcast_list(@user)
          Viewing.count.should eql? @broadcasts.size
        end

        describe 'update viewing' do
          before do
            Broadcast.each do |broadcast|
              broadcast.viewings.where(
                  viewer_id: @user.id,
                  viewer_type: @user.class.name
              ).first_or_initialize
            end
          end

          it 'wont create new record' do
            viewing_count = Viewing.count
            subject.broadcast_list(@user)
            viewing_count.shouls eql? Viewing.count
          end

          it 'must iterate impressions' do
            3.times do |i|
              @broadcasts = subject.broadcast_list(@user)
              @broadcasts.each do |broadcast|
                broadcast.viewings.where(
                    viewer_id: @user.id,
                    viewer_type: @user.class.name
                ).impressions.ssshould eql? i
              end
            end
          end
        end
      end
    end

    describe 'invalid' do
      it 'not set viewer' do
        expect {subject.broadcast_list(nil)}.to raise_error(Exception, 'Viewer not set')
      end
    end
  end
end
