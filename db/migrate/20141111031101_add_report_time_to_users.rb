class AddReportTimeToUsers < ActiveRecord::Migration
  def change
  	 add_column :users, :report_time, :datetime
  end
end
