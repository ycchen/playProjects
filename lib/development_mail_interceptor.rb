class DevelopmentMailInterceptor
	def self.delivering_email(message)
		message.subject = "[#{message.to}]  #{message.subject}"
		message.to = "chen1904@gmail.com"
	end
end