class ModifyColumnHidden < ActiveRecord::Migration
  def change
		change_column :sigs, :hidden, :integer
  end
end
