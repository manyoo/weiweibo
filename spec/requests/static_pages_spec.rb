require 'spec_helper'

describe "StaticPages" do
  describe "Home Page" do
    it "should have content 'Weiweibo'" do
        visit '/static_pages/home'
        page.should have_content('Weiweibo')
    end
  end

  describe 'Help Page' do
    it "should have content 'Help'" do
        visit '/static_pages/help'
        page.should have_content('Help')
    end
  end

  describe 'About Page' do
    it "should have content 'About Us'" do
        visit '/static_pages/about'
        page.should have_content('About Us')
    end
  end
end
