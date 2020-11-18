# StreetBees Challenge

The solution consists of two applications:

- backend (Sinatra API)
- frontend (React app)

## Backend

A single class (PasswordChecker) has been created for checking the password given current rules.
I would certainly break this class into more classes (one for each password type for instance: strong, ok and weak) to avoid complexity in case new rules are added.

A simple cache mechanism has been put in place to avoid reading the password_blacklist.txt many times. Of course this is not extremely necessary for now given it currently doesn't have many rows, but it could be useful once the blacklist grows (other cache stores like Redis might be a better fit in this case).

I would use a gem like https://github.com/IzumiSy/sinatra-validation to validate params if many are needed in the future.

### How to run

- Clone the repo: `git clone {{this_repo_url}}`
- Enter the backend folder: `cd backend`
- Install the dependencies: `bundle` (Ruby 2.7.1 is required)
- Run: `make run`

### Tests

In the backend folder run: `bundle exec rspec`

## Frontend

### How to run

- Clone the repo: `git clone {{this_repo_url}}`
- Enter the frontend folder: `cd frontend`
- Install the dependencies: `npm install`
- Run: `make run`
- Open your browser at http://localhost:3000/

### Tests

In the frontend folder run: `npm test`
