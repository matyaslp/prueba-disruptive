# README

This README would normally document whatever steps are necessary to get the
application up and running.

### Pre-requisites 📋

``` yml
Ruby 2.7.2
Rails ~ 6.1.5
bundler 2.1.4
yarn 1.22.5
```

### Installation 🔧

Change the `databse.yml` for your mysql username and password 


``` yml
  username: your_username
  password: your_password
```

Execute
``` bash
$ bundle install
$ yarn install
$ rails db:create db:migrate db:seed
```

### Usage
- In a console we lift the application
``` bash
$ rails s
```

- In another console we open the webpack console
```
$ bin/webpack-dev-server
```
---
