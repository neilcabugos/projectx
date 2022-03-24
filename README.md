# Projectx

Rails project with [devise](https://github.com/heartcombo/devise), [cancancan](https://github.com/CanCanCommunity/cancancan), [rails_admin](https://github.com/railsadminteam/rails_admin) integration


## Check it out!
To start up the application in your local Docker environment:
```bash
git clone https://github.com/neilcabugos/projectx.git
cd projectx
docker-compose build
docker-compose run --rm web rails db:create db:migrate db:seed
docker-compose up
```
