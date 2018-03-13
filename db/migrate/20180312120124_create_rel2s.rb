class CreateRel2s < ActiveRecord::Migration[5.0]
  def change
    create_table :rel2s do |t|
      t.references :micropost, foreign_key: true
      t.references :follow2, foreign_key: { to_table: :microposts }

      t.timestamps

      t.index [:micropost_id, :follow2_id], unique: true
    end
  end
end
