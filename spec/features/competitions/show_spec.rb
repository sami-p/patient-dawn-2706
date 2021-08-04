require 'rails_helper'

RSpec.describe 'The Competition Show Page' do
  # As a user
  # When I visit a competition's show page
  # Then I see the competition's name, location, and sport
  # And I see the nickname and hometown of all teams in this competition
  # And I see the average age of all players in the competition

  before :each do
    @competition_4 = Competition.create!(name: "The Goodest Boy", location: "Ministry of Magic", sport: "Ice Skating For Dogs")

    visit "/competitions/#{@competition_4.id}"
  end

  it 'displays the competition attributes' do
    expect(page).to have_content(@competition_4.location)
    expect(page).to have_content(@competition_4.sport)
  end

  xit 'displays the nickname and hometown of all teams in the competition' do
  end

  xit 'displays the average age of all players in the competition' do
  end
end
