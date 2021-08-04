require 'rails_helper'

RSpec.describe 'The Competition Show Page' do

  before :each do
    @competition_4 = Competition.create!(name: "The Goodest Boy", location: "Ministry of Magic", sport: "Ice Skating For Dogs")

    @team_1 = @competition_4.teams.create!(nickname: "Anything Is Pawsible", hometown: "Boston")
    @team_2 = @competition_4.teams.create!(nickname: "The Ultimutt Homies", hometown: "Aspen")
    @team_3 = @competition_4.teams.create!(nickname: "Pug Life", hometown: "Wheaton")
    @team_4 = @competition_4.teams.create!(nickname: "Bad To The Bone", hometown: "Dallas")
    @team_5 = Team.create!(nickname: "Ruff Around The Edges", hometown: "Jackson")

    @player_1 = @team_1.players.create!(name: "Rocky", age: 7)
    @player_2 = @team_1.players.create!(name: "Fido", age: 2)
    @player_3 = @team_2.players.create!(name: "Champ", age: 3)
    @player_4 = @team_2.players.create!(name: "Duke", age: 17)
    @player_5 = @team_3.players.create!(name: "Coop", age: 8)
    @player_6 = @team_3.players.create!(name: "Jet", age: 10)
    @player_7 = @team_4.players.create!(name: "Gerty", age: 5)
    @player_8 = @team_4.players.create!(name: "Rosie", age: 11)

    visit "/competitions/#{@competition_4.id}"
  end

  # As a user
  # When I visit a competition's show page
  # Then I see the competition's name, location, and sport
  # And I see the nickname and hometown of all teams in this competition
  # And I see the average age of all players in the competition

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

  it 'displays the average age of all players in the competition' do
    expect(page).to have_content(7.875)
  end

  # As a user
  # When I visit a competition's show page
  # Then I see a link to register a new team
  # When I click this link
  # Then I am taken to a new page where I see a form
  # When I fill in this form with a team's hometown and nickname
  # And I click submit
  # Then I am redirected back to the competition's show page
  # And I see the new team I created listed

  it 'displays a link to register a new team' do
    expect(page).to have_link("Register New Team Here")
  end

  it 'allows user to fill out a form and submit a new team through the link' do
    click_link "Register New Team Here"

    expect(current_path).to eq("/competitions/#{@competition_4.id}/teams/new")

    fill_in "Nickname", with: "Beagle and Shmear"
    fill_in "Hometown", with: "Salty Dog"
    click_on "Submit"

    expect(current_path).to eq("/competitions/#{@competition_4.id}")
    expect(page).to have_content("Beagle and Shmear")
    expect(page).to have_content("Salty Dog")
  end
end
