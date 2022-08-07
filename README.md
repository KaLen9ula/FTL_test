# Expenses controller app

This app is a test task to FTL

App installation on your local device

1. Required tools

* Ruby version: 3.0.0
* Rails version: 7.0.3.1
* PostgreSQL version: 14.4

2. Clone project from git repository and chose directory

```
git clone https://github.com/KaLen9ula/FTL_test.git
cd FTL_test
```

3. Create and setup database and bundle

```
rake db:create
rake db:migrate

bundle install
```

4. Run rails server

```
rails s
```

5. Run specs

```
rspec .
```

Deployed app on heroku: [Expense controller app](https://expenses-controller-app.herokuapp.com/)
