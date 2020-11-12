# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column           |    Type     |  Options         |
| ---------------- | ----------- | ---------------- |
| nickname         |   string    |  null: false     |
| email            |  string     |  null: false     |
|  password        |  string     |  null: false     |
|  name1           |  string     |  null: false     |
|  name2           |  string     |  null: false     |
|  birthday        |  integer    |  null: false     |

### Association

- has_many :items
- has_many :orders

## items テーブル
 
| Column           |    Type     |  Options         |
| ---------------- | ----------- | ---------------- |
| title            | string      | null: false      |
| explanation      | text        | null: false      |
| category_id      |  integer    |                  |
| state_id         |  integer    |                  |
| burden_id        |  integer    |                  |
|  area_id         |  integer    |                  |
| day_id           |  integer    |                  |
|  selling_price   |  integer    |  null: false     |
|   user           |  references | foreign_key: true|


### Association

- has_one :order
- belongs_to :user

## orders テーブル

| Column           |    Type     |  Options         |
| ---------------- | ----------- | ---------------- |
| card_num         | integer     | null: false      |
|  valid_date      |  integer    |  null: false     |
|  security        |  integer    | null: false      |
|  user            | references  | foreign_key: true|

### Association

- belongs_to :item
- belongs_to :user
- has_many :addresses


## addresses テーブル

| Column           |    Type     |  Options         |
| ---------------- | ----------- | ---------------- |
| post_code        | integer     |  null: false     |
| prefecture_id    | integer     |                  |
| city             | string      | null: false      |
| address          |  string     |  null: false     |
| building         |  string     |                  |
| phone_num        |  integer    |  null: false     |


### Association

- belongs_to :order
