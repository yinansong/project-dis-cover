class CreateManholecovers < ActiveRecord::Migration
  def change
    create_table :manholecovers do |t|
      t.string      :manhole_url,   :null => false
      t.string      :country,       :null => false
      t.string      :region,        :null => false
      t.string      :city,          :null => false
      t.integer     :year,          :null => false
      t.enum,       :color,         :null => false
      t.array       :keywords,      :default => "[]"
      t.string      :notes,         :default => "Just another manhole cover."
      t.boolean     :featured,      :default => false
      t.belongs_to  :collector

      t.timestamps
    end
  end
end
