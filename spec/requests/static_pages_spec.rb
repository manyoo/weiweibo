require 'spec_helper'

describe "StaticPages" do
  describe "Home Page" do
    it "should have content 'Weiweibo'" do
        visit root_path
        page.should have_selector('h1', :text => 'Weiweibo')
    end

    it "should have the base title" do
        visit root_path
        page.should have_selector('title', :text => "Ruby on Rails Tutorial App")
    end

    it "should have a custom page title" do
        visit root_path
        page.should_not have_selector('title', :text => '| Home')
    end
  end

  describe 'Help Page' do
    it "should have content 'Help'" do
        visit help_path
        page.should have_content('Help')
    end

    it "should have the title 'Help'" do
        visit help_path
        page.should have_selector('title', :text => "Ruby on Rails Tutorial App | Help")
    end
  end

  describe 'About Page' do
    it "should have content 'About Us'" do
        visit about_path
        page.should have_content('About Us')
    end

    it "should have the title 'About Us'" do
        visit about_path
        page.should have_selector('title', :text => "Ruby on Rails Tutorial App | About Us")
    end
  end

  describe 'Contact Page' do
    it "should have the h1 'Contact'" do
        visit contact_path
        page.should have_selector('h1', :text => "Contact")
    end

    it "should have the title 'Contact'" do
        visit contact_path
        page.should have_selector('title', :text => "Ruby on Rails Tutorial App | Contact")
    end
  end
end
