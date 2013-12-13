class CreateSigs < ActiveRecord::Migration
  def change
    create_table :sigs do |t|
      t.string :sig_id
      t.references :type, index: true
      t.references :group, index: true
      t.references :scan, index: true

      t.timestamps
    end
  end
end
