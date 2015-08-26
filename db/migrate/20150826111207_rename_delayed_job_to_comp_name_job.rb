class RenameDelayedJobToCompNameJob < ActiveRecord::Migration
  def change
    rename_table :delayed_jobs, :comp_name_jobs
  end
end
