module SessionsHelper
    def log_in(user)
        session[:user_id] = user.id
      end

      def current_user
        if session[:user_id]
          @current_user ||= User.find_by(id: session[:user_id])
        end
=begin
The above is the same as 
    if @current_user.nil?
    @current_user = User.find_by(id: session[:user_id])
    else
    @current_user
    end

=end        
      end
      
      def logged_in?
        !current_user.nil?
      end

    end
