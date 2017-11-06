class ApplicationController < ActionController::Base
  include ApplicationHelper
  include AccessHelper
  protect_from_forgery with: :exception

private

end
