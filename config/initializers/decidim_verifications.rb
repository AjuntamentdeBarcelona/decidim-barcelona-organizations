# frozen_string_literal: true

# We are using the same DirectVerifications engine without the admin part to
# create a 9 different custom verifications

Decidim::Verifications.register_workflow(:direct_verifications_grup1) do |workflow|
  workflow.engine = Decidim::DirectVerifications::Verification::Engine
end
Decidim::Verifications.register_workflow(:direct_verifications_grup2) do |workflow|
  workflow.engine = Decidim::DirectVerifications::Verification::Engine
end
Decidim::Verifications.register_workflow(:direct_verifications_grup3) do |workflow|
  workflow.engine = Decidim::DirectVerifications::Verification::Engine
end
Decidim::Verifications.register_workflow(:direct_verifications_grup4) do |workflow|
  workflow.engine = Decidim::DirectVerifications::Verification::Engine
end
Decidim::Verifications.register_workflow(:direct_verifications_grup5) do |workflow|
  workflow.engine = Decidim::DirectVerifications::Verification::Engine
end
Decidim::Verifications.register_workflow(:direct_verifications_grup6) do |workflow|
  workflow.engine = Decidim::DirectVerifications::Verification::Engine
end
Decidim::Verifications.register_workflow(:direct_verifications_grup7) do |workflow|
  workflow.engine = Decidim::DirectVerifications::Verification::Engine
end
Decidim::Verifications.register_workflow(:direct_verifications_grup8) do |workflow|
  workflow.engine = Decidim::DirectVerifications::Verification::Engine
end
Decidim::Verifications.register_workflow(:direct_verifications_grup9) do |workflow|
  workflow.engine = Decidim::DirectVerifications::Verification::Engine
end

# We need to tell the plugin to handle this method in addition to the default "Direct verification". Any registered workflow is valid.
Decidim::DirectVerifications.configure do |config|
  config.manage_workflows = %w(direct_verifications_grup1 direct_verifications_grup2 direct_verifications_grup3 direct_verifications_grup4 direct_verifications_grup5 direct_verifications_grup6 direct_verifications_grup7 direct_verifications_grup8 direct_verifications_grup9)
end
