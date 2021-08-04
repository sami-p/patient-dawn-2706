require 'rails_helper'

RSpec.describe 'The Competition Show Page' do
  # As a user
  # When I visit a competition's show page
  # Then I see the competition's name, location, and sport
  # And I see the nickname and hometown of all teams in this competition
  # And I see the average age of all players in the competition

  before :each do
    @competition_4 = Competition.create!(name: "The Goodest Boy", location: "Ministry of Magic", sport: "Ice Skating For Dogs")

    @team_1 = @competition_4.teams.create!(nickname: "Anything Is Pawsible", hometown: "Boston")
    @team_2 = @competition_4.teams.create!(nickname: "The Ultimutt Homies", hometown: "Aspen")
    @team_3 = @competition_4.teams.create!(nickname: "Pug Life", hometown: "Wheaton")
    @team_4 = @competition_4.teams.create!(nickname: "Bad To The Bone", hometown: "Dallas")
    @team_5 = Team.create!(nickname: "Ruff Around The Edges", hometown: "Jackson")

    visit "/competitions/#{@competition_4.id}"
  end

  it 'displays the competition attributes' do
    expect(page).to have_content(@competition_4.location)
    expect(page).to have_content(@competition_4.sport)
  end

  it 'displays the nickname and hometown of all teams in the competition' do
    expect(page).to have_content(@team_1.nickname)
    expect(page).to have_content(@team_2.nickname)
    expect(page).to have_content(@team_3.nickname)
    expect(page).to have_content(@team_4.nickname)
    expect(page).to_not have_content(@team_5.nickname)

    expect(page).to have_content(@team_1.hometown)
    expect(page).to have_content(@team_2.hometown)
    expect(page).to have_content(@team_3.hometown)
    expect(page).to have_content(@team_4.hometown)
    expect(page).to_not have_content(@team_5.hometown)
  end

  xit 'displays the average age of all players in the competition' do
  end
end
