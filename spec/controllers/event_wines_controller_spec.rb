require 'rails_helper'

describe EventWinesController do
	def stub_current_user user
    ApplicationController.any_instance.stub(:current_user) { user }
  end

  let(:user) {User.create(name: "jane doe", email: "jane@example.com", password: "test", password_confirmation: "test")}

  context 'GET #edit' do
    it "renders the :edit template" do
      stub_current_user(user)
      new_event_wine = EventWine.create()
      get :edit, id: new_event_wine
      expect(response).to render_template :edit
    end
  end
end
