ActiveAdmin.register User do

  permit_params :email, :password, :password_confirmation, :name, :gender, :date_of_birth
    index do
      selectable_column
      id_column
      column :name
      column :email
      column :password
      column :date_of_birth
      column :gender
      column :profile_picture
      column :created_at
      actions
    end
  
end  
