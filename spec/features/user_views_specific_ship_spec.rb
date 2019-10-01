require 'spec_helper'

feature "user looks at A ship" do
  scenario "user vists the show page" do
    Ship.create(name: "Enterprise", ship_class: "Galaxy", location: "Earth")

    visit "/"
    click_link "Enterprise"

    expect(page).to have_content "Enterprise"
    expect(page).to have_content "Galaxy"
  end
end
