class ApplicationController < ActionController::Base
  before_action :authenticate_admin!, if: :admin_url
  
  protected
  
  def admin_url
    request.fullpath.include?("/admin")
  end
  
  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      admin_path
    else
      super
    end
  end
end
