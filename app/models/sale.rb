class Sale < ApplicationRecord
	
    after_initialize :generate_guide
	belongs_to :content

	private
		def generate_guide
			self.guide = SecureRandom.uuid()
		end
end
