class ChangeDataJoyToPosts < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :joy, :boolean
  end
end
