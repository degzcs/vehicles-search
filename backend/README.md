# Beackend for Vehicles

### Install Backend

```bash
$ cd backend/
$ rake db:setup
$ rake db:seed
```
### Install Frontend

```bash
$ cd frontend/
$ npm install
$ yarn start
```

### Tests

```
$ RAILS_ENV=test rake db:migrate
$ rspec spec
```

### Private endpoints

#### Create Vehicle

```
$ curl -H "Content-Type: application/json"  -d '{ "brand": "Nissan", "model": "MURANO", "year": "2020", "price": 100000, "mileage": "1000" }' -X POST http://localhost:3000/admin/vehicles
```

#### Create Vehicle Model

```
$ curl -H "Content-Type: application/json"  -d '{ "brand": "Nissan", "name": "MYMURANO"}' -X POST http://localhost:3000/admin/vehicle_models
```
### Public endpoint
#### Search

```
$ curl -H "Content-Type: application/json"  -d '{ "filter": "model_name", "text": "MURANO"}' -X GET http://localhost:3000/search
```

### Contributors
- Diego Gomez

