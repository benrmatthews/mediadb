namespace :csvimport do

  desc "Import CSV Data."
  task :import_csv_data => :environment do

    require 'csv'

    csv_file_path = 'db/contacts.csv'

    CSV.foreach(csv_file_path) do |row|

      p = Contact.create!({
          :firstname => row[0],
          :lastname => row[1],
          :title => row[2],
          :publications => row[3],
          :email => row[4],
          :phone => row[5],
          :twitter => row[6],
          :bio => row[7],
          :verified => row[8],
        }
      )

    end

  end

end