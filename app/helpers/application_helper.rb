module ApplicationHelper

	def i18n_attributes(object = nil, method = nil)
		object && method ? object.model.human_attribute_name(method) : "Informe os parâmetros"	
	end

	def i18n_models(object = nil)
		object.model_name.human
	end
end
