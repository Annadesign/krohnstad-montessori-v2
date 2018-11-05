class Parent < ApplicationRecord
	has_secure_password
	has_many :child_parents, dependent: :destroy
	has_many :children, through: :child_parents

	validates :name, presence: true

	before_create { generate_token(:auth_token) }

	def send_password_reset
	  generate_token(:password_reset_token)
	  self.password_reset_sent_at = Time.zone.now
	  save!
	  ParentMailer.password_reset(self).deliver
	end

	def generate_token(column)
	  begin
	    self[column] = SecureRandom.urlsafe_base64
	  end while Parent.exists?(column => self[column])
	end


	def in_use?
		ChildParent.exists?(parent_id: self.id)
	end	

   def self.import(file)
   
      spreadsheet = Roo::Spreadsheet.open file
     
      header = spreadsheet.row 1
      (2..spreadsheet.last_row).each do |i|       
        row = [header, spreadsheet.row(i)].transpose.to_h
        ParentImportMailer.send_import_email(spreadsheet.cell('A', i), spreadsheet.cell('B', i), spreadsheet.cell('D', i)).deliver
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
