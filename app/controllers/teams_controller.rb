class TeamsController < ApplicationController

  def new
    @competition = Competition.find(params[:id])
  end

  def create
    @competition = Competition.find(params[:id])
    @team = @competition.teams.create!(team_params)
    redirect_to "/competitions/#{@competition.id}"
  end

  private

  def team_params
    params.permit(:id, :nickname, :hometown, :competition_id)
  end
end
