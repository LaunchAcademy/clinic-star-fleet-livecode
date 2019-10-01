require 'spec_helper'

feature "user makes A ship" do
  scenario "user vists the new page" do
    visit "/"
    click_link "Create your Own Starship!"
    fill_in "Name", with: "Defiant"
    fill_in "Ship Class", with: "Defiant"
    fill_in "Location", with: "Vulcan"
    click_button "Make it So #1"
    expect(page).to have_content "Defiant class vessel"
  end
end
