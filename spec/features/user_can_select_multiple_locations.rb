require 'spec_helper'

describe "a user can select more than one location" do

  50.times do  
    let!(:area) { FactoryGirl.create(:area) }
  end

  created_areas = create_list(:area, 25) 

  it "allows users to select more than one search area" do

    visit root_path

    click_link "STEP 1: Enter Your Search Location"

    expect(page).to have_content "Choose Your Desired NYC Area!"

    click_on 'area.title'
    click_on 'area.title'
  end
end