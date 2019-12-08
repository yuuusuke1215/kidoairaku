class ChangeDataSadToComments < ActiveRecord::Migration[5.2]
  def change
    change_column :comments, :sad, :boolean
  end
end
