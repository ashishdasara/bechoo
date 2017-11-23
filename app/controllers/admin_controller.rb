class AdminController < ApplicationController
  before_action :confirm_logged_in, only: :index
  before_action :is_admin, only: :index

  def index
  end

end
