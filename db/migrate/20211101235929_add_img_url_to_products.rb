class AddImgUrlToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :img_url, :text
  end
end
