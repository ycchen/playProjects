module ApplicationHelper

	def admin_area(&block)
		#concat "<div class='admin'>"
		yield
		#concat "</div>"
	end
end
