class AddImage4ToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :image4, :string
  end
end
