class ChangeDataSadToPosts < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :sad, :boolean
  end
end
