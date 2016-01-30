class SessionController < DeviseController

    def after_sign_in_path_for(resource)
        if resource.sign_in_count == 1
           welcome_path
        else
           root_path
        end
    end
    def destroy
      session.destroy
      redirect_to root_path
    end

end
