# _Shoe-Store_

##### This application is a demonstration application designed to show classes, tests, views with Sinatra and SQL (no Active Record).

## Technologies Used

Application: Ruby, Sinatra<br>
Testing: Rspec, Capybara<br>
Database: Postgres

Installation
------------

Install Shoe Store by first cloning the repository.  
```
$ git clone https://github.com/Aaron3831/shoe_store.git
```

Install required gems:

Gemfile <

source('https://rubygems.org')

gem("sinatra-contrib", :require => "sinatra/reloader")
gem("sinatra-activerecord")
gem("rake")
gem("pg")
gem("sinatra")

group(:test) do
  gem("rspec")
  gem("capybara")
  gem("pry")
end
```
$ bundle install
```

```
In your terminal:

rake db:create_migration NAME=create_shoes

Copy this into the migration:

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

In your terminal:

rake db:migrate

rake db:test:prepare

rake db:create_migration NAME=create_prices

Copy this into the migration:

class CreatePrices < ActiveRecord::Migration[5.1]
  def change
    create_table(:prices) do |t|
      t.column(:total, :integer)
      t.column(:cost_id, :integer)

      t.timestamps()
    end
  end
end

In your terminal:

rake db:migrate

rake db:test:prepare

rake db:create_migration NAME=create_stores

Copy this into the migration:

class CreateStores < ActiveRecord::Migration[5.1]
  def change
    create_table(:stores) do |t|
      t.column(:title, :string)
      t.column(:franchise_id, :integer)

      t.timestamps()
    end
  end
end

In your terminal:

rake db:migrate

rake db:test:prepare

rake db:create_migration NAME=create_franchises

Copy this into the migration:

class CreateFranchises < ActiveRecord::Migration[5.1]
  def change
    create_table(:franchises) do |t|
      t.column(:shoe_id, :integer)
      t.column(:store_id, :integer)

      t.timestamps()
    end
  end
end

In your terminal:

rake db:migrate

rake db:test:prepare

rake db:create_migration NAME=create_costs

Copy this into the migration:

class CreateCosts < ActiveRecord::Migration[5.1]
  def change
    create_table(:costs) do |t|
      t.column(:shoe_id, :integer)
      t.column(:price_id, :integer)

      t.timestamps()
    end
  end
end

rake db:migrate

rake db:test:prepare
```

Start the webserver:
```
$ ruby app.rb
```

Navigate to `localhost:4567` in browser.

License
-------

GNU GPL v2. Copyright 2017 **Aaron Nguyen**
