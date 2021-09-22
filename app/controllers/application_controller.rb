class ApplicationController < ActionController::Base
    after_action :reset

    private
    def reset
        p "+++++++++++++++++ application reset +++++++++++++++++++"
        session[:redirect] = false
    end
end
