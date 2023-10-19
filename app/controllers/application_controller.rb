class ApplicationController < ActionController::Base
  before_action :authorize, :set_i18n_locale_from_params

  protected
    def set_i18n_locale_from_params
      if params[:locale]
        if I18n.available_locales.map(&:to_s).include?(params[:locale])
          I18n.locale = params[:locale]
        else
          flash.now[:alert] = 
            "#{params[:locale]} translation not available"
          logger.error flash.now[:alert]
        end
      end
    end

    def authorize
      unless User.find_by(id: session[:user_id])
        redirect_to login_url, notice: "Please log in"
      end
    end
end