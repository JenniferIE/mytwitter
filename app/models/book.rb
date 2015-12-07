class Book < ActiveRecord::Base
	belongs_to :genre

	validates :title, presence: true
	validates :year, numericality: { only_integer: true }
end
