class AddUserContributionsAssociationToUser < ActiveRecord::Migration[7.0]
  def change
    change_table :user_contributions do |t|
      t.belongs_to :user
    end
  end
end
