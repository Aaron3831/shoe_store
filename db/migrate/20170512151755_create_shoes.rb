class CreateShoes < ActiveRecord::Migration[5.1]
  def change
    create_table(:shoes) do |t|
      t.column(:brand, :string)
      t.column(:cost_id, :int)
      t.column(:franchise_id, :int)

      t.timestamps()
    end
  end
end
