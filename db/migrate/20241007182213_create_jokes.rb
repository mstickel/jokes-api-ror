class CreateJokes < ActiveRecord::Migration[7.2]
  def change
    create_table :jokes do |t|
      t.text :body

      t.timestamps
    end
  end
end
