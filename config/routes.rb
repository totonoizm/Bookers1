Rails.application.routes.draw do
 root :to => 'books#index'
 get 'books', to: 'books#new' # URLの変更　"sample", to: "sample#new" で　sample/newが/sampleに変わる
 resources :books

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
