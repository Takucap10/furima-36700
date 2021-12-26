class ApplicationController < ActionController::Base
  before_action :configue_permitted_parameters, if: :devise_controller?

  private

  def configue_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:name, :first_name, :last_name, :first_name_kana, :last_name_kana, :birth_day])
  end
end
