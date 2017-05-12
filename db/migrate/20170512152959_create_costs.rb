class CreateCosts < ActiveRecord::Migration[5.1]
  def change
    create_table(:costs) do |t|
      t.column(:shoe_id, :integer)
      t.column(:price_id, :integer)

      t.timestamps()
    end
  end
end
