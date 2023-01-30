class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.date :startdate
      t.date :enddate
      t.string :mark
      t.string :memo

      t.timestamps
    end
  end
end
