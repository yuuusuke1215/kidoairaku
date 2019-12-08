class CreateRejects < ActiveRecord::Migration[5.2]
  def change
    create_table :rejects do |t|
      t.references :user, foreign_key: true
      t.references :reject, foreign_key: { to_table: :users }

      t.timestamps
      
      t.index [:user_id, :reject_id], unique: true
    end
  end
end
