require 'rails_helper'

RSpec.describe Competition do
  describe 'relationships' do
    it {should have_many :competing_teams}
    it {should have_many(:teams).through(:competing_teams)}
  end
end
