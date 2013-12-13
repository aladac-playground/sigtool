class AddSystemIdToSig < ActiveRecord::Migration
  def change
    add_column :sigs, :system_id, :integer
  end
end
