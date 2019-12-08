class ChangeDataHappyToComments < ActiveRecord::Migration[5.2]
  def change
    change_column :comments, :happy, :boolean
  end
end
