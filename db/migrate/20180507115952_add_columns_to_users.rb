class AddColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users ,:password,:string
    add_column :users , :date_of_birth, :datetime
    add_column :users , :gender, :string
    add_column :users , :profile_picture, :binary
end
end
