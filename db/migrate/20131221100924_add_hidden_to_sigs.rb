class AddHiddenToSigs < ActiveRecord::Migration
  def change
    add_column :sigs, :hidden, :boolean
  end
end
