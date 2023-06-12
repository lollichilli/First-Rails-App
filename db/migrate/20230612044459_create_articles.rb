class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      # Two columns are defined: title and body
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
