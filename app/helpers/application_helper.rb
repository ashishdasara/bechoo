module ApplicationHelper

  def error_messages_for(object)
    render(:partial => 'application/error_messages', :locals => {:object => object})
  end

  def status_tag(boolean, options={})
    options[:true_text]  ||= ''
    options[:false_text] ||= ''

    if boolean
      content_tag(:span, options[:true_text], :class => 'status true')
    else
      content_tag(:span, options[:false_text], :class => 'status false')
    end
  end


  def delete_link(path)
  link_to ('<span class="glyphicon glyphicon-remove" area-hidden="true"></span>remove').html_safe,
              path,
              method: :delete,
              data: { confirm: "Are you sure?" },
              class: 'btn btn-danger btn-lg'
  end
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  def edit_link(path)
    link_to ('<span class="glyphicon glyphicon-pencil" area-hidden="true"></span>edit').html_safe,
              path,
              class: "btn btn-warning btn-lg"
  end

  def link_to_dash
    link_to ('<span class="g  lyphicon glyphicon-home" area-hidden="true"></span> home').html_safe,
              access_menu_path,
              class: "btn btn-primary btn-lg"
  end

  def link_back(path)
    link_to ('<span class="glyphicon glyphicon-step-backward" area-hidden="true"></span>back').html_safe,
              path,
              class: "btn btn-info btn-lg"
  end

  def link_to_show(path)
    link_to ('<span class="glyphicon glyphicon-new-window" area-hidden="true"></span> show').html_safe,
              path,
              class: "btn btn-success btn-md"
  end

  def link_to_new(path)
    link_to ('<span class="glyphicon glyphicon-plus" area-hidden="true"></span> add new').html_safe,
              path,
              class: "btn btn-success btn-lg"

  end

end
