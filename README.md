Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.

## Export the staging DB

```bash
pg_dump -d turtlecamp_development -f turtlecamp_dev_db.psql
pg_dump -d turtlecamp_production -f turtlecamp_prod_db.psql
```

## Import the staging DB

```bash
sed -i -- 's/OWNER\ TO\ turtlecamp/OWNER\ TO\ guochunzhong/g' turtlecamp_prod_db.psql
psql -d postgres
DROP DATABASE turtlecamp_development;
CREATE DATABASE turtlecamp_development WITH ENCODING='UTF8' OWNER='guochunzhong';
\q
psql -d turtlecamp_development -f turtlecamp_prod_db.psql
```

## Setting up the envioroment

1 - Clone the project in your machine
```bash
clone git@github.com:johncalvinroberts/turtlecamp.git
```

2 - Create and update the **application.yml** file
```bash
cd turtlecamp/config
touch application.yml
```
The information of the yml file is on **trello** on the **notes board**


3 - Installing the gems & setup of the db
```bash
bundle install
rails g public_activity:migration
rails db:create
rails db:migrate
rails db:seed
```
