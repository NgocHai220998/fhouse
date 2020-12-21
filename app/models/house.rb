class House < ApplicationRecord
  has_many  :house_photos
  belongs_to :user
  has_many :comment
  has_many :care
  
  accepts_nested_attributes_for :house_photos, allow_destroy: true, reject_if: proc { |attributes| attributes["photo"].blank? }

  def increase_view
    if (self.view)
      update_attribute :view, (self.view + 1)
    else
      update_attribute :view, 1
    end
  end

  # import data
  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      house = find_by_id(row["id"]) || new
      house.attributes = row.to_hash.slice(*row.to_hash.keys)
      house.save!
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
end
