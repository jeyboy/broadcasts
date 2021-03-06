class AddBroadcasts < ActiveRecord::Migration
  def change
    create_table :broadcasts do |t|
      t.belongs_to :creator, polymorphic: true
      t.string :title
      t.text :content
      t.datetime :start_at
      t.datetime :end_at

      t.integer :viewings_count, default: 0
      t.integer :hidden_viewings_count, default: 0
      t.integer :impressions, default: 0

      t.timestamps
    end
  end
end
