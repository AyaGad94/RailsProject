Rails.application.routes.draw do
  devise_for :users
  # devise_for :users
  # devise_for :users, :controllers => {:registrations => "users/registrations"}  
  resources :comments
  resources :courses
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


resources :users do
  #/users/male
  collection do
    get :male 
    end

end

resources :lectures do
   member do
   put "like", to: "lectures#upvote"
   put "dislike", to: "lectures#downvote"
   get "spam" , to: "lectures#spam", as: "spam"
   end
end

mount Commontator::Engine => '/commontator'
 
end




