class AddForIdToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :for_id, :integer
  end
end
