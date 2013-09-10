# Default url mappings are:
# 
# * a controller called Main is mapped on the root of the site: /
# * a controller called Something is mapped on: /something
# 
# If you want to override this, add a line like this inside the class:
#
#  map '/otherurl'
#
# this will force the controller to be mounted on: /otherurl.
module Gotdebt
  class MainController < Controller
    # the index action is called automatically when no other action is specified
    def index
      @title = 'Got Debt?'
    end

    # the string returned at the end of the function is used as the html body
    # if there is no template for the action. if there is a template, the string
    # is silently ignored
    def notemplate
      @title = 'Got Debt?'
      
      return 'There is no \'notemplate.xhtml\' associated with this action.'
    end

    def login
      @title = "Login"
      redirect_referer if logged_in?
      return unless request.post?
      user_login(request.subset(:login, :password))
      redirect MainController.r(:index)
    end

    def register
      @title = "Register for an account"
      
      if request.post?
        @user = User.new
        @user[:email] = request[:email]
        @user.password = request[:password]
        @user.password_confirmation = request[:password_confirmation]
        @user.salt = Digest::SHA1.hexdigest("--#{Time.now.to_f}--#{user.email}--") 
        
        if @user.save
            flash[:message] = 'Account created, feel free to login below'
            redirect MainController.r(:index)
        end
      end
    end
  end
end
