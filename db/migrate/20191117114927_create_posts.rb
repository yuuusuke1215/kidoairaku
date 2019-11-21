class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :content
      t.string :joy
      t.string :angry
      t.string :sad
      t.string :happy
      t.string :video
      t.json :images
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
