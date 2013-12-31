namespace :db do
	desc "Copy database to backups folder"
	task backup: :environment do
		db   = Rails.root + ActiveRecord::Base.configurations[Rails.env]["database"]
		dir  = Rails.root + "db/backups/"
		backupname = "#{Time.now.utc.xmlschema}-%s".gsub(':','')
		`mkdir -p #{dir}`
		`cp #{db} #{dir + backupname % File.basename(db)}`
	end
end