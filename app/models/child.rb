class Child < ApplicationRecord
 	has_many :child_parents, dependent: :destroy
	has_many :parents, through: :child_parents, dependent: :destroy
  belongs_to :department

  	attr_accessor :file

  	validates_presence_of :lastname

  	scope :by_name_and_age, -> { order(lastname: :asc, birthdate: :asc) }

 	def self.filter_by_parents param_parent
  		includes(:parents).where(parents: {name: param_parent}).order(id: :asc)
  	end  	


    def self.import(file)
   
      spreadsheet = Roo::Spreadsheet.open file
     
      header = spreadsheet.row 1
      (2..spreadsheet.last_row).each do |i|       
        row = [header, spreadsheet.row(i)].transpose.to_h
        create! row
      end
    end	

	def self.open_spreadsheet(file)
		case File.extname(file.original_filename)
			when ".csv" then Roo::Csv.new(file.path, packed: nil, file_warning: :ignore)
			when ".xls" then Roo::Excel.new(file.path, packed: nil, file_warning: :ignore)
			when ".xlsx" then Roo::Excelx.new(file.path, packed: nil, file_warning: :ignore)
		else raise "Unknown file type: #{file.original_filename}"
		end
	end


end
