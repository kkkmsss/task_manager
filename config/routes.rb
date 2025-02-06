Rails.application.routes.draw do
  root 'tasks#index'
  resources :tasks
  get 'tasks/univ' => 'tasks#univ'
  get 'tasks/club' => 'tasks#club'
  get 'tasks/job' => 'tasks#job'
end