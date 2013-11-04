class AdminController < ApplicationController
  load_and_authorize_resource :user
  load_and_authorize_resource :admin,:through=>:user,:singleton=>true
  def show
    
  end
end
