require 'rails_helper'

describe EventWinesController do
	def stub_current_user user
    ApplicationController.any_instance.stub(:current_user) { user }
  end

  let(:user) {User.create(name: "jane doe", email: "jane@example.com", password: "test", password_confirmation: "test")}
  let(:new_event_wine) {EventWine.create()}

  context 'GET #edit' do
  	it "redirects with no valid user" do
    	new_event_wine
      get :edit, id: new_event_wine
      expect(response).to redirect_to root_path
    end

  	it "assigns the requested event wine to @event_wine" do
      stub_current_user(user)
      new_event_wine
      get :edit, id: new_event_wine
      expect(assigns(:event_wine)).to eq new_event_wine
    end

    it "renders the :edit template" do
      stub_current_user(user)
      new_event_wine
      get :edit, id: new_event_wine
      expect(response).to render_template :edit
    end
  end

  describe 'PATCH #update' do
  	before :each do
	    @event_wine = EventWine.create()
		end

  	it "changes @event_wine's attributes " do
  		stub_current_user(user)
  		patch :update, id: @event_wine, event_wine: {is_attending: true}
  		@event_wine.reload
  		expect(@event_wine.is_attending).to be true
  	end

  	context "user is attending event" do
	  	it "redirects to show event_wine" do
	  		stub_current_user(user)
	  		patch :update, id: @event_wine, event_wine: {is_attending: true}
	  		expect(response).to redirect_to @event_wine
	  	end
	  end

	  context "user is not attending event" do
	  	it "redirects to homepage" do
	  		stub_current_user(user)
	  		patch :update, id: @event_wine, event_wine: {is_attending: false}
	  		expect(response).to redirect_to root_path
	  	end
  	end
  end
end
