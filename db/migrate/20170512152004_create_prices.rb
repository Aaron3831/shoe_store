class CreatePrices < ActiveRecord::Migration[5.1]
  def change
    create_table(:prices) do |t|
      t.column(:total, :integer)
      t.column(:cost_id, :integer)

      t.timestamps()
    end
  end
end
