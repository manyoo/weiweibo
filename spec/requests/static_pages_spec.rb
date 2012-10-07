require 'spec_helper'

describe "StaticPages" do
  describe "Home Page" do
    it "should have content 'Weiweibo'" do
        visit '/static_pages/home'
        page.should have_selector('h1', :text => 'Weiweibo')
    end

    it "should have the base title" do
        visit '/static_pages/home'
        page.should have_selector('title', :text => "Ruby on Rails Tutorial App")
    end

    it "should have a custom page title" do
        visit '/static_pages/home'
        page.should_not have_selector('title', :text => '| Home')
    end
  end

  describe 'Help Page' do
    it "should have content 'Help'" do
        visit '/static_pages/help'
        page.should have_content('Help')
    end

    it "should have the title 'Help'" do
        visit '/static_pages/help'
        page.should have_selector('title', :text => "Ruby on Rails Tutorial App | Help")
    end
  end

  describe 'About Page' do
    it "should have content 'About Us'" do
        visit '/static_pages/about'
        page.should have_content('About Us')
    end

    it "should have the title 'About Us'" do
        visit '/static_pages/about'
        page.should have_selector('title', :text => "Ruby on Rails Tutorial App | About Us")
    end
  end
end
