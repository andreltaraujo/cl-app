module ApplicationHelper

	def i18n_attributes(object = nil, method = nil)
		object && method ? object.model.human_attribute_name(method) : "Informe os parâmetros"	
	end

	def i18n_models(object = nil)
		object.model_name.human
	end

	def dynamic_render_helper(action, enrollment)
		if action == 'show'
			render 'show_enrollment_fields', f: enrollment
		else
			render 'enrollment_fields', f: enrollment
		end
	end

	def dynamic_link_helper(action, user, f)
		if action == 'show'
			link_to(t('devise.shared.links.back'), :back, class:"mt-4 px-4 justify-center rounded-md bg-sky-600 py-2 text-sm font-semibold text-white hover:bg-sky-700")
		else
			content_tag(:div, class: 'block mt-4') do
				concat link_to_add_association(t('activerecord.attributes.add_field', resource: user.enrollments.model_name.human), f, :enrollments, class: 'font-bold mt-4 text-sm text-gray-900')
				concat f.submit('Enviar', class:'block mt-4 px-4 justify-center rounded-md bg-sky-600 py-2 text-sm font-semibold text-white hover:bg-sky-700')
			end
		end
	end
end
