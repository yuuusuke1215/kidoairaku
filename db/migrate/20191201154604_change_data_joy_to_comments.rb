class ChangeDataJoyToComments < ActiveRecord::Migration[5.2]
  def change
    change_column :comments, :joy, :boolean
  end
end
