class AddImageIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :image_id, :string
  end
   # belongs_to :user
end
