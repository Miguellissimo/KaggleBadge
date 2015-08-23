class FixColumnCName < ActiveRecord::Migration
  def change
    rename_column :challenges, :name, :team_name
  end
end
