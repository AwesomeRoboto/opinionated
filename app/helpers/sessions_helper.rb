module SessionsHelper
	#log in: set user ID cookie in user's browser
	def log_in(user)
		cookies.permanent[:cookie_id] = user.id

		@current_user = user
	end
	#LOG OUT: remove cookies from user's browser
	def log_out
		cookies.delete(:cookie_id)

	end

	#true if user logged in
	def logged_in?
		cookies[:cookie_id] ? true : false

	end

	#If not already set, retrieve user from MongoDB
	def current_user
		if logged_in?
			@current_user ||= User.find(cookies[cookie_id])
		else
			nil
		end
	end

	#current_user Setter (similar to attr_writer)
	def current_user=(user)
		@current_user = user
	end
end
