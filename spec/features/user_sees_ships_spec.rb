require 'spec_helper'

feature "user looks at some ships" do
  scenario "user visists the index" do
    Ship.create(name: "Enterprise", ship_class: "Galaxy", location: "Earth")
  
    visit "/"
    expect(page).to have_content "Enterprise"
  end
end
