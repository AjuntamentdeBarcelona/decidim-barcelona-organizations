# frozen_string_literal: true

every 1.day, at: "2:00 am", roles: [:worker] do
  rake "decidim:open_data:export"
end

every 1.day, at: "4:00 am", roles: [:worker] do
  rake "decidim:metrics:all"
end
