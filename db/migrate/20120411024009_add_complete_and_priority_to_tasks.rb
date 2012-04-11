class AddCompleteAndPriorityToTasks < ActiveRecord::Migration
	def change
		add_column :tasks, :complete, :boolean, :default => false
		add_column :tasks, :priority, :integer
	end
end
