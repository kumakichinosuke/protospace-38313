#テーブル設計

＃＃userテーブル


| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name　　　          | string | NOT null    |
| email              | string | NOT null ユニーク制約 |
| encrypted_password | string | NOT null　　 |
| 
| profile            | text   | NOT null    |
| occupation         | text   | NOT null    |
| position           | text   | NOT null    |

### Association

- has_many :coments
- has_many :prototypes


＃＃prototypeテーブル


| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| title 　　          | string | NOT null    |
| catch_copy         | text   | NOT null    |
| concept            | text   | NOT null　　 |
| user               | reference   | NOT null,外部キー  |


### Association

- has_many :coments
- belongs_to :users


＃＃commentsテーブル


| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| content　          | text   | NOT null    |
| prototype          | reference | NOT null,外部キー |
| user               | reference | NOT null,外部キー |

### Association

- belongs_to :users
- belongs_to :prototype