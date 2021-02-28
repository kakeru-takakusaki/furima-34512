## users

|Column          |Type  |Options                  |
|----------------|------|-------------------------|
|nickname        |string|null: false, unique: true|
|email           |string|null: false, unique: true|
|password        |string|null: false              |
|family_name     |string|null: false              |
|first_name      |string|null: false              |
|family_name_kana|string|null: false              |
|first_name_kana |string|null: false              |
|birthday        |string|null: false              |

### Association

-has_many :items
-has_many :purchases


## items

|Column     |Type   |Options            |
|-----------|-------|-------------------|
|item_name  |string |null: false        |
|text       |text   |null: false        |
|price      |integer|null: false        |
|category   |string |null: false        |
|item_status|string |null: false        |
|sipping_fee|string |null: false        |
|prefecture |string |null: false        |
|sipping_day|string |null: false        |
|sold_out   |string |                   |
|image      |        ActiveStorage      |
|user_id    |        foreign_key: true  |


### Association

-belongs_to :user
-has_one    :purchases


## purchases

|Column |Type   |Options            |
|-------|-------|-------------------|
|item_id|     foreign_key: true     |
|user_id|     foreign_key: true     |

### Association

-belongs_to :item
-belongs_to :user
-has_one:   :sipping_address


## sipping_addresses

|Column      |Type   |Options            |
|------------|-------|-------------------|
|postal_code |string |null: false        |
|prefecture  |string |null: false        |
|municipality|string |null: false        |
|address     |string |null: false        |
|phone_number|integer|null: false        |
|purchase_id |     foreign_key: true     |

### Association

-belongs_to :purchase