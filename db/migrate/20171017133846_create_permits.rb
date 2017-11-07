class CreatePermits < ActiveRecord::Migration[5.1]
  def change
    create_table :permits, id: false do |t|
      t.string :permit_id, primary_key: true
      t.datetime :date_issued
      t.string :issued_by
      t.date :date_entered
      t.string :entered_by
      t.bigint :user_id, foreign_key: true

      t.timestamps
    end
  end
end
