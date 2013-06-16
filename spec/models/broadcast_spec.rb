require 'spec_helper'

describe Broadcasts::Broadcast do
  subject { Broadcasts::Broadcast }

  describe 'live scope' do
    before(:all) do
      @nil_dates_broadcast = create(:broadcast)
      @invalid_start_dates_broadcast = create(:broadcast, start_at: 1.minute.from_now)
      @valid_start_dates_broadcast = create(:broadcast, start_at: 2.minutes.from_now)
      @valid_end_dates_broadcast = create(:broadcast, end_at: 2.hours.from_now)
      @invalid_end_dates_broadcast = create(:broadcast, end_at: 1.seconds.from_now)
      @valid_both_dates_broadcasts = create(:broadcast, start_at: 1.seconds.from_now, end_at: 2.hours.from_now)
      sleep(2)
    end

    before { @broadcasts = subject.live(6) }

    it 'must include only valid entries' do
      @broadcasts.should include(
                             @nil_dates_broadcast,
                             @valid_end_dates_broadcast,
                             @valid_both_dates_broadcasts
                         )
    end

    it 'must not include invalid entries' do
      @broadcasts.should_not include(
                                 @invalid_start_dates_broadcast,
                                 @invalid_end_dates_broadcast
                             )
    end
  end

  describe 'broadcast list' do
    before { @user = create(:admin_user) }

    describe 'valid' do
      describe 'must update impressions' do
        it 'new viewing' do
          Broadcasts::Viewing.count.should eql 0
          @broadcasts = subject.broadcast_list(@user)
          Broadcasts::Viewing.count.should eql @broadcasts.size
        end

        describe 'update viewing' do
          before do
            subject.all.each do |broadcast|
              broadcast.viewings.where(
                  viewer_id: @user.id,
                  viewer_type: @user.class.name
              ).first_or_initialize
            end
          end

          it 'wont create new record' do
            viewing_count = Broadcasts::Viewing.count
            subject.broadcast_list(@user)
            viewing_count.should eql Broadcasts::Viewing.count
          end

          it 'must iterate impressions' do
            3.times do |i|
              @broadcasts = subject.broadcast_list(@user)
              @broadcasts.each do |broadcast|
                broadcast.viewings.where(
                    viewer_id: @user.id,
                    viewer_type: @user.class.name
                ).each {|viewing| viewing.impressions.should eql i + 1}
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
