class CreateSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :searches do |t|
      t.string :origin
      t.string :destination
      t.datetime :departure_date
      t.datetime :return_date

      t.timestamps
    end
  end
end
