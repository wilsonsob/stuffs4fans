class AddSellerToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :seller, :boolean, default: false
  end
end
