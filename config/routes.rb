Rails.application.routes.draw do
 root :to => 'books#index' #ルーティングの設定
 get 'books', to: 'books#new' # URLの変更　"sample", to: "sample#new" で　sample/newが/sampleに変わる
 resources :books

end
