#require 'spec_helper'
#
#describe Broadcasts::BroadcastsController do
#  describe 'GET #index' do
#    describe 'render & status' do
#      before { get :index }
#
#      it 'responds successfully with an HTTP 200 status code' do
#        expect(response).to be_success
#      end
#
#      it 'renders the index template' do
#        expect(response).to render_template(:index)
#      end
#    end
#
#    describe 'values' do
#      before(:all) do
#        @nil_dates_broadcast = create(:broadcast)
#        @valid_end_dates_broadcast = create(:broadcast, end_at: 2.hours.from_now)
#        @valid_both_dates_broadcasts = create(:broadcast, start_at: 1.seconds.from_now, end_at: 2.hours.from_now)
#        sleep(2)
#      end
#
#      (1..2).each do |count|
#        it "must use count limit (#{count}) for fetch result" do
#          get :index, count: count
#
#          assigns(:broadcasts).size.should eql count
#        end
#      end
#    end
#  end
#
#  describe 'DELETE #destroy' do
#    before(:all) do
#      @broadcast = create(:broadcast)
#      @broadcast.hidden_at.should be_nil
#      delete :destroy, id: @broadcast.id
#    end
#
#    it 'must mark as hidden' do
#      @broadcast.reload.hidden_at.should_not be_nil
#    end
#  end
#end