namespace :notification do
  desc '利用者にメールを送信'
  task send_emails_from_admin: :environment do
    NotificationFromAdminJob.perform_later('rake task test')
  end
end
