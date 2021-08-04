require 'rails_helper'

RSpec.describe Team do
  describe 'relationships' do
    it {should have_many(:competing_teams)}
    it {should have_many(:competitions).through(:competing_teams)}
    it {should have_many(:players)}
  end
end
