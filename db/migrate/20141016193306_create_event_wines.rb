class CreateEventWines < ActiveRecord::Migration
  def change
    create_table :event_wines do |t|
      t.boolean :is_attending
      t.belongs_to :event
      t.belongs_to :wine
      t.belongs_to :user

      t.timestamps
    end
  end
end
