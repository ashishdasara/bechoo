class ApplicationController < ActionController::Base
  include ApplicationHelper
  include AccessHelper

  protect_from_forgery with: :exception

  private

  def require_proper_route_for_role
    url_path = request.url
    params_path = url_path.split('?').last
    if user_signed_in?
      if current_user.admin? && request.path !~ /^\/admin/ && request.path !~ /^\/logout/
        if params_path == url_path
          redirect_to "/admin#{request.path}"
        else
          redirect_to "/admin#{request.path}?#{params_path}"
        end
      elsif request.path =~ /^\/admin/ && !current_user.admin?
        redirect_to "#{request.path.sub('/admin','')}"
      end
    end
  end
end










#
# Started GET "/comments/new?advertisement_id=21" for 127.0.0.1 at 2017-11-18 22:09:44 +0530
# Processing by CommentsController#new as HTML
#   Parameters: {"advertisement_id"=>"21"}
#   User Load (0.7ms)  SELECT  `users`.* FROM `users` WHERE `users`.`id` = 1 LIMIT 1
# Redirected to http://localhost:3000/admin/comments/new
# Filter chain halted as :require_proper_route_for_role rendered or redirected
# Completed 302 Found in 3ms (ActiveRecord: 0.7ms)
#
#
# Started GET "/comments/new?advertisement_id=21" for 127.0.0.1 at 2017-11-18 22:11:29 +0530
# Processing by CommentsController#new as HTML
#   Parameters: {"advertisement_id"=>"21"}
#   User Load (0.7ms)  SELECT  `users`.* FROM `users` WHERE `users`.`id` = 2 LIMIT 1
#   Advertisement Load (0.7ms)  SELECT  `advertisements`.* FROM `advertisements` WHERE `advertisements`.`id` = 21 LIMIT 1
#   Rendering comments/new.html.erb within layouts/application
#   Rendered comments/new.html.erb within layouts/application (2.2ms)
