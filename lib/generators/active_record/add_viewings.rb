class AddViewings < ActiveRecord::Migration
  def change
    create_table :viewings do |t|
      t.belongs_to :viewer, polymorphic: true
      t.belongs_to :broadcast

      t.datetime :hidden_at
      t.integer :impressions

      t.timestamps
    end
  end
end
