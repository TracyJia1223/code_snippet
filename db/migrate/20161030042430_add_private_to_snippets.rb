class AddPrivateToSnippets < ActiveRecord::Migration[5.0]
  def change
    add_column :snippets, :is_private?, :boolean
  end
end
