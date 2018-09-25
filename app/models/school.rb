class School < ApplicationRecord
has_many :departments, dependent: :destroy	
end
