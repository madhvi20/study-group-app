# Study Group App

A Rails application for managing study groups, students, and study materials.

## Features

- User authentication with Devise
- Admin and Student roles
- Group management
- Study material upload and sharing
- Student enrollment in groups

## Setup

1. Clone the repository
2. Install dependencies:
   ```bash
   bundle install
   ```
3. Set up the database:
   ```bash
   rails db:create db:migrate
   ```
4. Start the server:
   ```bash
   rails server
   ```

## Deployment

The application is deployed on Heroku. To deploy:

1. Create a Heroku app
2. Set up the database:
   ```bash
   heroku run rails db:migrate
   ```
3. Set up environment variables in Heroku dashboard

## Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request
