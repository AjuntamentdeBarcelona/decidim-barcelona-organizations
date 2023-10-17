# frozen_string_literal: true

module Decidim
  # Shared behaviour for force_users_to_authenticate_before_access_organization
  module ForceAuthenticationOverride
    extend ActiveSupport::Concern

    included do
      private

      def unauthorized_paths
        %w(/locale /manifest.webmanifest) + Decidim::StaticPage.where(
          organization: current_organization,
          allow_public_access: true
        ).pluck(Arel.sql("CONCAT('/pages/', slug)"))
      end
    end
  end
end
