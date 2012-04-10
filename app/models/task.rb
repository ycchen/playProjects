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
			find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
		else
			find(:all)
		end
	end
end
