class CreateStores < ActiveRecord::Migration[5.1]
  def change
    create_table(:stores) do |t|
      t.column(:title, :string)
      t.column(:franchise_id, :integer)

      t.timestamps()
    end
  end
end
