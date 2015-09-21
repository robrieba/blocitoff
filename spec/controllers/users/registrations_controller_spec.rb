require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :controller do

  let (:new_user_attributes) do
    {
      email: "member@exampl.com",
      password: "password",
      password_confirmation: "password"
    }
  end

  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "instantiates a new user" do
      get :new
      expect(:user).to_not be_nil
    end
  end

  describe "POST create" do
    it "returns http success" do
      post :create, user: new_user_attributes
      expect(response).to have_http_status(:redirect)
    end

    it "creates a new user" do
      expect{
        post :create, user: new_user_attributes
      }.to change(User, :count).by(1)
    end

    it "sets user email properly" do
      post :create, user: new_user_attributes
      expect(assigns(:user).email).to eq new_user_attributes[:email]
    end

    it "sets user password properly" do
      post :create, user: new_user_attributes
      expect(assigns(:user).password).to eq new_user_attributes[:password]
    end

    it "sets user password_confirmation properly" do
      post :create, user: new_user_attributes
      expect(assigns(:user).password_confirmation).to eq new_user_attributes[:password_confirmation]
    end
  end

  
end
