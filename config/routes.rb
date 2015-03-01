 Rnarrails::Application.routes.draw do

  resources :step_qas

  resources :step_rms

  resources :alignparams

  get "result/quality"
  get "result/mapping"
  get "result/transcript"
  get "result/expression"

  get "result/index"
  get "result/show_qualPlot"
  get "result/trim" 
  get "result/show_basePlot"
  get "result/show_baseCGPlot"
  
  get "result/show_file1"
  get "result/show_file2"
  get "result/show_qualy"
  
  get "result/show_qualPlotAll"
  get "result/show_kmerKLPlot"

  resources :analyses
  resources :pipelines
  resources :pipesteps

  resources :documents

  get "document/index"
  get "document/new"
  get "document/create"

  get "dashboard/index"
  get "static_pages/help"
  get "static_pages/errorR"
  
  get "user/login"

  get "pipesteps/viewquality"

#  devise_for :users
  devise_for :users #, :controllers => {:registrations => "registrations"}

  get "home/index"
  get "demo/index"
  get "demo/show"
  get "users/login"

  get "download", to: 'download#index'
  
  #match '/:controller/:action', :via => [:get, :post]

  root to: 'home#index' 

  resources :demo do
      collection do
        get :show_image
      end
  end

  devise_scope :user do
     get "sign_in", :to => "devise/sessions#new"
     get "sign_out", :to => "devise/sessions#destroy"
     get "sign_up", :to => "devise/registrations#new"
     get "edit", :to => "devise/registrations#edit"
 end

end
