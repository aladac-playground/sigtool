class AddRegionIdToSystem < ActiveRecord::Migration
  def change
    add_column :systems, :region_id, :integer
  end
end
