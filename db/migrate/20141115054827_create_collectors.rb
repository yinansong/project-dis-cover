class CreateCollectors < ActiveRecord::Migration
  def change
    create_table :collectors do |t|
      t.string :headshot_url     :default => ""
      t.string :name,            :null => false
      t.string :email,           :null => false, :unique => true
      t.string :password_digest, :null => false

      t.timestamps
    end
  end
end
