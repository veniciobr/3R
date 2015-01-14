class Project < ActiveRecord::Base

#validates :password, presence: true, length: { minimum: 6 }, confirmation: true, 
#    unless: Proc.new { |a| !a.new_record? && a.password.blank? }
	belongs_to :user
	has_many   :pipeline
	mount_uploader :controlfile1, Controlfile1Uploader
	mount_uploader :controlfile2, Controlfile2Uploader

	#before_create :assign_id
	#before_validation :default_to_zero_if_necessary, :on => :create

	#def self.from_param(param)
	#    find_by_ident(param)
	#end

	#def to_param
	#   self.encrypted_id
	#end

	#protected
	#  def assign_id
	#    self.encrypted_id = Digest::SHA1.hexdigest(SecureRandom.random_number(1<<256).to_s)
	#  end

	#  def default_to_zero_if_necessary
	#    self.encrypted_id = 0 if self.encrypted_id.blank?
	#  end
end
