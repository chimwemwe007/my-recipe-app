Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'

  end
  
  resources :recipes do
    resources :recipe_foods, except: [:edit, :update]
    resources :general_shopping_lists, only: [:index]
  end

  namespace :users do
    get 'general_shopping_list', to: 'your_controller#your_action'
  end


   
    resources :foods do
      resources :recipe_foods
    end
    resources :public_recipes
    resources :shopping_lists
    resources :recipes do
      resources :recipe_foods, only: [:new, :create, :destroy, :update, :edit]

    end
    
  root to: "public_recipes#index"
end
