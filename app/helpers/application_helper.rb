module ApplicationHelper

  def check_has_children(dept, person)
    @mes ||= Child.joins(:child_parents).where("child_parents.parent_id" => person, :department_id => dept)
  end


	def status_converter(status, truthy: 'Active', falsey: 'Pending')
		if status
			truthy
		else
			falsey
		end
	end

  def count_active_parents
    @count_parents = Parent.all.count
    @count_active = Parent.where(:isverified => true).count

    "#{@count_active} av #{@count_parents}"
  end

	def time_ago time
		"#{time_ago_in_words(time)} ago"
	end

	def double_digit_number n 
		'%02d' % n
	end

    def is_active_controller(controller_name)
        params[:controller] == controller_name ? "active" : nil
    end

    def is_in_controller(controller_name)
        params[:controller] == controller_name ? "in" : nil
    end    

    def is_active_action(action_name)
        params[:cat] == action_name ? "active" : nil
    end

    def is_active_menu(menu_name)
        params[:id] == menu_name ? "active" : nil
    end    

    def current_class?(test_path)
    return 'active' if request.path == test_path
    ''
  	end

  	def current_image_style(img_style)
  		return "#{img_style}-img"
  	end

end
