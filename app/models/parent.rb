class Parent < ApplicationRecord
	has_secure_password
	has_many :child_parents, dependent: :destroy
	has_many :children, through: :child_parents

	validates :name, presence: true

	def in_use?
		ChildParent.exists?(parent_id: self.id)
	end	
end
