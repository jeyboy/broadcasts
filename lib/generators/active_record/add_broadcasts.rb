class AddBroadcasts < ActiveRecord::Migration
  def self.up
    create_table :broadcasts do |t|
      t.references :creator, polymorphic: true
      t.string :title
      t.text :content
      t.datetime :start_at
      t.datetime :end_at

      t.integer :viewings_count, default: 0
      t.integer :hidden_viewings_count, default: 0
      t.integer :impressions

      t.timestamps
    end
  end

  def self.down
    drop_table :broadcasts
  end
end
