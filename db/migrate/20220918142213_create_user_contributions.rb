class CreateUserContributions < ActiveRecord::Migration[7.0]
  def change
    create_table :user_contributions do |t|
      t.string  :contribution_type
      t.integer :contributed_record_id

      t.timestamps
    end
  end
end
