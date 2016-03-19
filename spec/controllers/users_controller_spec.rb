require 'rails_helper'

describe UsersController, :type => :controller do
  context "Create user" do
    before do
      @user = User.create!(first_name: "test", 
        last_name: "guy", 
        email: "test@test.com", 
        password: "testtest")
      @user2 = User.create!(first_name: "some", 
        last_name: "person", 
        email: "test2@test.com", 
        password: "testtest")
    end

    describe "GET #show" do

      context "User is logged in" do
        before do
          sign_in @user
        end

        it "loads correct user details" do
          get :show, id: @user.id
          expect(response).to have_http_status(200)
          expect(assigns(:user)).to eq @user
        end
      end

      context "No user logged in" do
        it "redirects to login" do
          get :show, id: @user.id
          expect(response).to redirect_to('/login')
        end
      end

      context "Second user is logged in" do
        before do
          sign_in @user2
        end

        it "cannot access show page of 1st user" do
          get :show, id: @user.id
          expect(response).to redirect_to(root_path)
        end

        it "loads correct user details" do
          get :show, id: @user2.id
          expect(response).to have_http_status(200)
        end
      end

    end
  end
end