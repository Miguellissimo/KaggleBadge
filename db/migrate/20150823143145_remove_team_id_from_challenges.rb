class RemoveTeamIdFromChallenges < ActiveRecord::Migration
  def change
    remove_column :challenges, :team_id, :integer
  end
end
