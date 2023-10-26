class ApplicationController < ActionController::Base
  before_action :authorize, :set_i18n_locale_from_params

  def route_not_found
    render file: Rails.public_path.join('404.html'), status: :not_found, layout: false
  end

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