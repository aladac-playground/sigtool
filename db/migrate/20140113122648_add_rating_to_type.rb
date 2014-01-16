class AddRatingToType < ActiveRecord::Migration
  def change
    add_column :types, :rating, :integer
  end
end
