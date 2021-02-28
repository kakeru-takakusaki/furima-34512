## users

|Column            |Type  |Options                  |
|------------------|------|-------------------------|
|nickname          |string|null: false, unique: true|
|email             |string|null: false, unique: true|
|encrypted_password|string|null: false              |
|family_name       |string|null: false              |
|first_name        |string|null: false              |
|family_name_kana  |string|null: false              |
|first_name_kana   |string|null: false              |
|birthday          |date  |null: false              |

### Association

-has_many :items
-has_many :purchases


## items

|Column        |Type      |Options            |
|--------------|----------|-------------------|
|name          |string    |null: false        |
|text          |text      |null: false        |
|price         |integer   |null: false        |
|category_id   |integer   |null: false        |
|status_id     |integer   |null: false        |
|sipping_fee_id|integer   |null: false        |
|prefecture_id |integer   |null: false        |
|sipping_day_id|integer   |null: false        |
|user          |references|foreign_key: true  |


### Association

-belongs_to :user
-has_one    :purchase


## purchases

|Column |Type      |Options             |
|-------|----------|--------------------|
|item   |references|foreign_key: true   |
|user   |references|foreign_key: true   |

### Association

-belongs_to :item
-belongs_to :user
-has_one:   :sipping_address


## sipping_addresses

|Column       |Type      |Options            |
|-------------|----------|-------------------|
|postal_code  |string    |null: false        |
|prefecture_id|integer   |null: false        |
|municipality |string    |null: false        |
|address      |string    |null: false        |
|building_name|string    |null: false        |
|phone_number |string    |null: false        |
|purchase     |references|foreign_key: true  |

### Association

-belongs_to :purchase