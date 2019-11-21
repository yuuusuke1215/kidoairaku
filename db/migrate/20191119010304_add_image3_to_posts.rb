class AddImage3ToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :image3, :string
  end
end
