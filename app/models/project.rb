class Project < ActiveRecord::Base

#validates :password, presence: true, length: { minimum: 6 }, confirmation: true, 
#    unless: Proc.new { |a| !a.new_record? && a.password.blank? }
	belongs_to :user
	has_many   :document
end
