class AddPictureToPost < ActiveRecord::Migration
  def change
    add_column :posts, :picture, :text
  end
end
