class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.boolean :is_attending, null: false
      t.belongs_to :event, null: false
      t.belongs_to :user, null: false
      t.belongs_to :wine, null: false

      t.timestamps
    end
  end
end
