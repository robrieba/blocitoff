require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create!(username: "member", email: "member@example.com", password: "password") }

  it { should allow_value("user@example.com").for(:email) }
  it { should_not allow_value("userexample.com").for(:email) }
  it { should_not allow_value(" ").for(:email) }

  it { should_not allow_value("1234567").for(:password) }
  it { should allow_value("12345678").for(:password) }

  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:email) }

  describe "attributes" do
    it "should respond to email" do
      expect(user).to respond_to(:email)
    end

    it "should respond to password" do
      expect(user).to respond_to(:email)
    end
  end

end
