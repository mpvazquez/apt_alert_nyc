require 'spec_helper'

describe "a user can select a single location before doing listing searches" do
    #setup -- no user login necessary
    #test database is seeded with areas

  50.times do  
    let!(:area) { FactoryGirl.create(:area) }
  end

  it "selects a single location to do search" do
    #workflow for feature
    visit root_path
    within ".steps" do 
      expect(page).to have_content "Search Location"
    end

    visit areas_path
    select area.title, from: "areas"

    click_button "Select Areas"

    visit listings_path(area)

  #expectations
    within ".select_area" do
      expect(page).to have_content "#{area.title}"
      save_and_open_page
    end
  end
end