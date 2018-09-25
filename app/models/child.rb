class Child < ApplicationRecord
 	has_many :child_parents, dependent: :destroy
	has_many :parents, through: :child_parents
  	belongs_to :department

  	scope :by_name_and_age, -> { order(lastname: :asc, birthdate: :asc) }

 	def self.filter_by_parents param_parent
  		includes(:parents).where(parents: {name: param_parent}).order(id: :asc)
  	end  	
end
