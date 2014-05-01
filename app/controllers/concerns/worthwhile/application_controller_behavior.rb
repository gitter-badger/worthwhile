module Worthwhile
  # Inherit from the host app's ApplicationController
  # This will configure e.g. the layout used by the host
  module ApplicationControllerBehavior
    extend ActiveSupport::Concern
    
    included do
      rescue_from CanCan::AccessDenied do |exception|
        redirect_to main_app.root_url, :alert => exception.message
      end
    end
  end
end