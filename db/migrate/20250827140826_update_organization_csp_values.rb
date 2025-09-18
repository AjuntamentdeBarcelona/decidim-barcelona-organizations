class UpdateOrganizationCspValues < ActiveRecord::Migration[7.0]
  def change
    Decidim::Organization.find_each do |organization|
      next unless organization.content_security_policy.empty?

      organization.content_security_policy = {
        "img-src" => "ajbcn-decidim-barcelona-organizations-staging.s3.eu-south-2.amazonaws.com ajbcn-decidim-barcelona-organizations.s3.eu-west-1.amazonaws.com",
        "font-src" => "",
        "frame-src"=> "www.youtube.com",
        "media-src" => "",
        "style-src" => "",
        "script-src" => "stats.decidim.org cdnjs.cloudflare.com plausible.io",
        "connect-src" => "stats.decidim.org plausible.io ajbcn-decidim-barcelona-organizations-staging.s3.eu-south-2.amazonaws.com ajbcn-decidim-barcelona-organizations.s3.eu-west-1.amazonaws.com",
        "default-src" => ""
      }
      organization.save!
    end
  end
end
