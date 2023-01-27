# frozen_string_literal: true

# Restore visible_for from the HasPrivateUsers concern
# Remove this file after upgrading to a version of Decidim where the visible_for method of Assembly is removed
require_dependency Decidim::Assemblies::Engine.root.join("app", "models", "decidim", "assembly").to_s

class Decidim::Assembly
  def self.visible_for(user)
    if user
      return all if user.admin?

      where(
        id: public_spaces +
            private_spaces
              .joins(:participatory_space_private_users)
              .where(decidim_participatory_space_private_users: { decidim_user_id: user.id })
      )
    else
      public_spaces
    end
  end
end
