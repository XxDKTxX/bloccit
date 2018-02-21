Rails.application.routes.draw do
  
  

  resources :advertisement
  
  resources :posts
  
  resources :question
  
  root 'welcome#index'
  
end