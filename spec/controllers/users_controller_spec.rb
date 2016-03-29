require 'rails_helper'

describe UsersController, :type => :controller do
  context "Create user" do
    before do
      @user = FactoryGirl.create(:user)
      @user2 = FactoryGirl.create(:user)
    end

    describe "GET #show" do

      context "User is logged in" do
        before do
          sign_in @user
        end

        it "loads the correct user details" do
          get :show, id: @user.id
          expect(response).to have_http_status(200)
          expect(assigns(:user)).to eq @user
        end

        it "cannot access the show page of 2nd user" do
          get :show, id: @user2.id
          expect(response).to redirect_to(root_path)
        end
      end

      context "No user is logged in" do
        it "redirects to login" do
          get :show, id: @user.id
          expect(response).to redirect_to(new_user_session_path)
        end
      end
    end
  end
end 