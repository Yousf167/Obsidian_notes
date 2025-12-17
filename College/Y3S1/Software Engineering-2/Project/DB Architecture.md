
### User Table

| Field         | Type              |
| ------------- | ----------------- |
| _id           | MongoDB obj       |
| email         | string            |
| password_hash | string            |
| DOB           | Date obj          |
| address       | string            |
| type          | enum(admin, user) |



### user-package

| Field         | Type                  | Purpose     |
| ------------- | --------------------- | ----------- |
| user_id       | int                   | foreign key |
| *package type | Enum(basic, advanced) |             |
\*basic: full meal options
advanced: full meal options, all activities
full option: all options


### transactions

| Field    | Type                  |
| -------- | --------------------- |
| user_id  | MongoDb obj           |
| trans_id | int (row_number)      |
| amount   | double                |
| location | Location obj          |
| Package  | Enum(basic, advanced) |
| date     | Date obj              |

### locations table

| Field         | Type              | Purpose                           |
| ------------- | ----------------- | --------------------------------- |
| `id`          | string / int      | Unique identifier                 |
| `name`        | string            | Location name shown to user       |
| `latitude`    | float             | Coordinates                       |
| `longitude`   | float             | Coordinates                       |
| `description` | string (optional) | Shown in popup / details          |
| `type`        | string (optional) | campsite, shop, point-of-interest |
