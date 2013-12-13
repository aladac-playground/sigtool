class AddRidToScan < ActiveRecord::Migration
  def change
    add_column :scans, :rid, :string
  end
end
