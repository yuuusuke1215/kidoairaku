class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true
      t.string :content
      t.string :joy
      t.string :angry
      t.string :string
      t.string :sad
      t.string :happy
      t.string :image1
      t.string :image2
      t.string :image3
      t.string :image4

      t.timestamps
    end
  end
end
