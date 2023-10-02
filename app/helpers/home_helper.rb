module HomeHelper
	def sign_in_or_out_link(model, sign_in_path, sign_out_path)
    resource = model.to_s.downcase
		if public_send("#{resource}_signed_in?")
      button_to sign_out_path, method: :delete, class: "font-medium text-cyan-600 pr-4 hover:text-gray-500 inline-block" do
        content_tag(:i, '', class: icon_class(resource)) + "#{i18n_models(model)} #{t('devise.shared.links.sign_out')}"
			end
    else
      link_to sign_in_path, id: "#{resource}In", class: "font-medium text-cyan-600 pr-4 hover:text-gray-500 inline-block" do
        content_tag(:i, '', class: icon_class(resource)) + "#{i18n_models(model)} #{t('devise.shared.links.sign_in')}"
			end
    end
  end
	
  def icon_class(resource)
    case resource
    when "user"
      "fas fa-user fa-fw inline-block pt-2 mr-1"
    when "admin"
      "fas fa-users fa-fw inline-block pt-2 mr-1"
    when "educ"
      "fas fa-chalkboard-teacher fa-fw inline-block pt-2 mr-1"
    else
      ""
    end
  end
end
