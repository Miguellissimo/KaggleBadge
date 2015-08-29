class RenameCompNameJobToDelayedJob < ActiveRecord::Migration
  def change
    rename_table :comp_name_jobs, :delayed_jobs
  end
end
