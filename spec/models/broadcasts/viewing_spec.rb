require 'spec_helper'

describe Broadcasts::Viewing do
  subject { Broadcasts::Viewing }

  describe 'by viewer scope' do
    before do
      @user, @other_user = create(:admin_user), create(:admin_user)
      @user_viewings = (1..3).map {create(:viewing, viewer_type: @user.class.name, viewer_id: @user.id)}
      @other_user_viewings = (1..3).map {create(:viewing, viewer_type: @other_user.class.name, viewer_id: @other_user.id)}
      @viewings = subject.by_viewer(@user)
    end

    it 'must include only valid entries' do
      @viewings.should include @user_viewings
    end

    it 'must not include invalid entries' do
      @viewings.should_not include @other_user_viewings
    end
  end

  describe 'callbacks' do
    before { @viewing = create(:viewing)}

    it 'must increase hidden viewings' do
      was_hidden_viewings_count = @viewing.broadcast.hidden_viewings_count
      @viewing.hidden_at = Time.zone.now
      @viewing.save
      (@viewing.broadcast.hidden_viewings_count - was_hidden_viewings_count).should eql? 1
    end

    it 'must decrease hidden viewings' do
      broadcast = @viewing.broadcast
      @viewing.destroy
      (broadcast.hidden_viewings_count_was - broadcast.hidden_viewings_count).should eql? 1
    end

    it 'must increase impressions' do
      was_impressions = @viewing.broadcast.impressions
      @viewing.impressions = @viewing.impressions + 1
      @viewing.save
      (@viewing.broadcast.impressions - was_impressions).should eql? 1
    end
  end
end
