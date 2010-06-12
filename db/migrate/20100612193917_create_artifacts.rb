class CreateArtifacts < ActiveRecord::Migration
  def self.up
    create_table :artifacts do |t|
      t.date :when_posted
      t.integer :location
      t.date :start_date
      t.date :end_date
      t.boolean :is_an_offer
      t.text :content
      t.text :origin_uri

      t.timestamps
    end
  end

  def self.down
    drop_table :artifacts
  end
end
