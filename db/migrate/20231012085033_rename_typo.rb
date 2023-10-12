class RenameTypo < ActiveRecord::Migration[7.0]
  def change
    rename_column :orders, :adress, :address
  end
end
