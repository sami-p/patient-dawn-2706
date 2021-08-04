class CreateCompetingTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :competing_teams do |t|
      t.references :team, foreign_key: true
      t.references :competition, foreign_key: true

      t.timestamps
    end
  end
end
