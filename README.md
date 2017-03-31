Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.

## Export the staging DB

```bash
pg_dump -d turtlecamp_development -f turtlecamp_dev_db.psql
```

## Import the staging DB

```bash
sed -i -- 's/user_name/guochunzhong/g' turtlecamp_dev_db.psql
psql
DROP DATABASE turtlecamp_development;
CREATE DATABASE turtlecamp_development WITH ENCODING='UTF8' OWNER='guochunzhong';
\q
psql -d turtlecamp_development -f turtlecamp_dev_db.psql
```

