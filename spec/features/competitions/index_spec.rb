require 'rails_helper'

RSpec.describe 'The Competition Index Page' do
#   As a user
#   When I visit the competion index
#   Then I see the names of all competitions
#   Each competition name links to its show page

  before :each do
    @competition_1 = Competition.create!(name: "Nifty Knitters", location: "Diagon Alley", sport: "Extreme Knitting")
    @competition_2 = Competition.create!(name: "Bubble Trouble", location: "Hogwarts", sport: "Synchronized Bubble Gum Bubble Blowing")
    @competition_3 = Competition.create!(name: "Do The Wave", location: "Gringotts", sport: "Stop The Microwave Before It Beeps Relay Race")
    @competition_4 = Competition.create!(name: "The Goodest Boy", location: "Ministry of Magic", sport: "Ice Skating For Dogs")

    visit "/competitions"
  end

  it 'displays the names of all competitions' do
    expect(page).to have_content(@competition_1.name)
    expect(page).to have_content(@competition_2.name)
    expect(page).to have_content(@competition_3.name)
    expect(page).to have_content(@competition_4.name)
  end

  it 'each name is a link to that competition show page' do
    expect(page).to have_link(@competition_1.name)
    expect(page).to have_link(@competition_2.name)
    expect(page).to have_link(@competition_3.name)
    expect(page).to have_link(@competition_4.name)

    click_link "The Goodest Boy"
    expect(current_path).to eq("/competitions/#{@competition_4.id}")
  end
end
