class LuftballonRentalRequest < ActiveRecord::Base
  attr_accessible :luftballon_id, :start_date, :end_date, :status

  validates(
  	:luftballon_id,
  	:start_date,
  	:end_date,
  	:status,
  	:presence => true
  )
  validates :status, :inclusion => ["PENDING", "APPROVED", "DENIED"]

  validate :no_time_travel
  validate :no_overlapping_requests

  before_validation do
  	self.status ||= "PENDING"
  end

  belongs_to :luftballon





  #private

  def no_overlapping_requests
  	return if self.denied?

  	errors[:base] << "That luftballon is already booked during that period" unless overlapping_approved_requests.empty?
  end

  def overlapping_requests
  	conditions = <<-SQL
  	luftballon_id = :luftballon_id
  	AND
  	end_date > :start_date
  	AND
  	start_date < :end_date
  	SQL

  	overlapping_requests = LuftballonRentalRequest.where(conditions, {
  		:luftballon_id => self.luftballon_id,
  		:start_date => self.start_date,
  		:end_date => self.end_date
  		})

  	if self.id.nil?
  		overlapping_requests
  	else
  		overlapping_requests.where("id != ?", self.id) # Don't include self!
  	end
  end

  def overlapping_approved_requests
  	overlapping_requests.where(:status => "APPROVED")
  end

  def overlapping_pending_requests
    overlapping_requests.where(:status => "PENDING")
  end

  def no_time_travel
  	errors[:base] << "End date must come after start date" if self.start_date > self.end_date
  end

  def approve!
  	raise "not pending!" unless self.status == "PENDING"
  	transaction do
  		self.status = "APPROVED"
  		self.save!
  		overlapping_pending_requests.each do |request|
  			request.status = "DENIED"
  			request.save!
  		end
  	end
  end

  def deny!
  	self.status = "DENIED"
  	self.save!
  end

  def pending?
    self.status == "PENDING"
  end

  def approved?
  	self.status == "APPROVED"
  end

  def denied?
  	self.status == "DENIED"
  end
end
