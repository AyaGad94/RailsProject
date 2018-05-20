ActiveAdmin.register Lecture do
  permit_params :course_id, :user_id, :content

    index do
      selectable_column
      id_column
      column :content
      column :created_at
      actions
    end
    
   filter :course_id
    filter :user_id
end  