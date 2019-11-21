class AddImage1ToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :image1, :string
  end
end
