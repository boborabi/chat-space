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

# Ignore Byebug command history file.
.byebug_history

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false|

### Association
- has_many :posts
- has_many :groups, through: :users_groups

## groupsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|user_id|reference|null: false, foreign_key: true|

### Association
- has_many :posts
- has_many :users, through: :users_groups

## postsテーブル
|Column|Type|Options|
|------|----|-------|
|text|string|null: false|
|image|string||
|user_id|reference|null: false, foreign_key: true|
|group_id|reference|null: false, foreign_key: true|
|created_at|timestamp|null: false|
|updated_at|timestamp|null: false|

### Association
- belongs_to :user
- belongs_to :group

## users_groupsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|reference|null: false, foreign_key: true|
|group_id|reference|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :group