module Trestle
  module Auth
    module ControllerMethods
      extend ActiveSupport::Concern

      included do
        before_action :authenticate_user!
        before_action :require_admin!
      end

      protected

      def require_admin!
        redirect_to root_url, alert: "Only administrators is authorized to access this area" unless current_user.admin?
      end
    end
  end
end
