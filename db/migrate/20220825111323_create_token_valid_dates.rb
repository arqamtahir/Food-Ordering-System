class CreateTokenValidDates < ActiveRecord::Migration[6.1]
  def change
    create_table :token_valid_dates do |t|
      t.string :start_date
      t.string :end_date

      t.timestamps
    end
  end
end
