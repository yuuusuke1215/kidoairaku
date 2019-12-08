class ChangeDataAngryToComments < ActiveRecord::Migration[5.2]
  def change
    change_column :comments, :angry, :boolean
  end
end
