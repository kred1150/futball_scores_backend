class CreateCompetitions < ActiveRecord::Migration[7.0]
  def change
    create_table :competitions do |t|
      t.integer :external_id
      t.string :name
      t.string :code
      t.string :country_name
      t.string :country_code
      t.string :country_flag
      t.string :competition_type
      t.string :competition_logo
      t.string :plan
      t.string :last_update

      t.timestamps
    end
  end
end
