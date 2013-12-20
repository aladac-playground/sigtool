class AddRegionIdToCons < ActiveRecord::Migration
  def change
    add_column :cons, :region_id, :integer
  end
end
