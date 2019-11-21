class ChangeDataHappyToPosts < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :happy, :boolean
  end
end
