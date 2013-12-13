class AddConsIdToSystem < ActiveRecord::Migration
  def change
    add_column :systems, :cons_id, :integer
  end
end
