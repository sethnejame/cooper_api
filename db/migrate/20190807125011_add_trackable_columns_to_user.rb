class AddTrackableColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      ## Trackable
      t.add_column :sign_in_count, :integer, :default => 0
      t.add_column :current_sign_in_at, :datetime
      t.add_column :last_sign_in_at, :datetime
      t.add_column :current_sign_in_ip, :string
      t.add_column :last_sign_in_ip, :string
    end
  end
end
