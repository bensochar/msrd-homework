# Homework for a wellness company

Uses the ::magic:: of Inertia for the views. Much nicer than the [way I used to do it](https://bensochar.com/2020/01/20/sprinkling-vue-into-rails/).

To run locally...

### 1. Clone the repo

```bash
git clone https://github.com/bensochar/msrd-homework.git msrd
cd msrd
```

### 2. Install dependencies

Uses Ruby 3.2.2 & node 18.20.4

```bash
rvm use
bundle install
nvm use
nvm install
```

### 3. Setup database

```bash
bundle exec rails db:setup
```

### 5. Run the app

Uses Foreman to start Rails server & Vite server

```bash
bin/dev
```
