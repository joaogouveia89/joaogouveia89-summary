Rails.application.routes.draw do
  get 'home/index'
  get 'download' => 'home#generate_pdf_resume'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
end
