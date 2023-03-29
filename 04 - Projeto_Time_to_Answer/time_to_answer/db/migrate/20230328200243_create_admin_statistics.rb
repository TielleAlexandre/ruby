class CreateAdminStatistics < ActiveRecord::Migration[6.1]
  def change
    create_table :admin_statistics do |t|
      t.string :event
      t.integer :value

      t.timestamps
    end
  end
end
