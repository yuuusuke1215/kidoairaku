class AddImage2ToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :image2, :string
  end
end
