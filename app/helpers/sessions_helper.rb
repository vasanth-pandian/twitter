module SessionsHelper
	def sign_in(user)
      cookies.permanent[:remember_token] = user.remember_token
      self.current_user = user
    end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user     # Useless! Don't use this line.
  end
end
