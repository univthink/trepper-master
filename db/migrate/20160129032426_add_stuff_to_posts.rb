class AddStuffToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :title, :string
    add_column :posts, :body, :text
    add_column :posts, :summary, :string
    add_column :posts, :author_id, :integer
    add_column :posts, :published, :boolean
  end
end
