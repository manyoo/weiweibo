require 'spec_helper'

describe "UserPages" do
  subject { page }

  describe 'Signup Page' do
    before { visit signup_path }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a new user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before {
        fill_in "Name",      with:"Eric Wong"
        fill_in "Email",     with:"ericsyw@gmail.com"
        fill_in "Password",  with:"123456"
        fill_in "Confirmation", with:"123456"
      }
      it "should create a new user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end

      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by_email("ericsyw@gmail.com") }
        it { should have_selector('title', text: user.name) }
        it { should have_selector('div.alert.alert-success', text: 'Welcome') }
        it { should have_link('Sign out') }
      end
    end

    it { should have_selector('h1', text: 'Sign up') }
    it { should have_selector('title', text: full_title('Sign up')) }
  end

  describe 'Profile Page' do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_selector('h1', text:user.name) }
    it { should have_selector('title', text:user.name) }
  end
end
