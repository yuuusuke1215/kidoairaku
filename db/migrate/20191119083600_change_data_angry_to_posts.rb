class ChangeDataAngryToPosts < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :angry, :boolean
  end
end
