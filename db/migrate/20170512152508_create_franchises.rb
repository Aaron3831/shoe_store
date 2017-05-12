class CreateFranchises < ActiveRecord::Migration[5.1]
  def change
    create_table(:franchises) do |t|
      t.column(:shoe_id, :integer)
      t.column(:store_id, :integer)

      t.timestamps()
    end
  end
end
