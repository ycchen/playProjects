class Task < ActiveRecord::Base
	validates_presence_of :name
	#stringify_time :due_at

# before create a plugin stringify_time
	def due_at_string
		due_at.to_s(:db)
	end

	def due_at_string=(due_at_str)
		self.due_at = Time.parse(due_at_str)
	rescue ArgumentError
		@due_at_invalid = true
	end

	def validate
		errors.add(:due_at, "is invalid") if @due_at_invalid
	end

	def self.search(search)
		if search
			find(:all, :conditions => ['name LIKE ? and complete=?', "%#{search}%", 'f'])
		else
			# find(:all, :conditions => {:complete => false})
			find(:all)
		end
	end

	def self.find_near_due(date)
		#debugger
		due_date = date + 10
		find(:all, :conditions => ['due_at < ?', due_date], :order => 'due_at')
	end
end
