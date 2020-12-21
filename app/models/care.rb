class Care < ApplicationRecord
  belongs_to :user
  belongs_to :house

  # import data
  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      care = find_by_id(row["id"]) || new
      care.attributes = row.to_hash.slice(*row.to_hash.keys)
      care.save!
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then Roo::CSV.new(file.path)
    when ".xls" then Roo::Excel.new(file.path)
    when ".xlsx" then Roo::Excelx.new(file.path)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

  after_create do
    user_host = House.find_by(id: self.house_id).user
    Notification.create(user_id: 1, title: "Ai đó vừa quan tâm đến ngôi nhà của bạn", status: "none", user_recived_id: user_host.id)
  end
end
