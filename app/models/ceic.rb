class Ceic < ApplicationRecord

	def short_slug
		letters = self.slug.split('')
		letters[0..5].join('')
	end
end
