# README

##  Welcome to Hawk Set

Our Hawk Set project is a Set card game clone. It's an online solo game that tests your matching and set creation skills.

Goal: Race against the clock to select as many valid sets as you can, as quickly as possible.

 Card Attributes: Color, Shape, Shading, and Shape Count.

 How to Make a Set:
  1) Select three cards with no matching attributes.
  2) Select three cards with as many matching attributes as you want, BUT that attribute must be present across all three selected cards.

 Rule #1: A set can not contain only two cards with a matching attribute. All three cards must have that attribute or only one may have it.

 Game Over: The game is over when there are no more cards left in the deck, and there are no more sets available on the board.

 Hints: If there are no more sets on the current board, but still cards in the deck, we will give you three more cards.

## Core Goals:

1. User can create an account
2. The start of the game displays 12 cards on the board
3. User must be able to select sets based on the cards displayed on board
4. The computer must check that a user generated set is in fact a valid set
5. Computer tracks the number of valid sets a user makes
6. When the computer determines that there are no more sets add 3 more cards to the board
7. Have a timer that counts up until the end of the game is over (when the deck is empty and there are no more sets determined by the computer)
8. Show a statistics page of individual games in aggregate

## Stretch Goals:

1. Visualize the user statistics
2. Animate cards dealt and removed
3. Make it multiplayer

## Project Management Tool

[Trello Link](https://trello.com/b/Mp7E2fiV/hawkset-board)

## Ruby version

* Built using Ruby 2.4.1 and Rails 5.1.3

## System dependencies

* macOS version (~> 10.1)

* bundler

* Ruby 2.4.1

* Rails 5.1.3

* PostgreSQL 9.6.3

## Configuration

    $ git clone https://github.com/jshopsin/Hawk_Set

    $ cd Hawk_Set

    $ bundle install

    $ rails db:setup

    $ rails server

## Database

The website uses a Postgres database

* postgres (PostgreSQL) 9.6.3

### Database creation

    $ rails db:create

### Database initialization

    $ rails db:migrate

    $ rails db:seed

### Database schema

![DB schema](https://github.com/jshopsin/Hawk_Set/blob/master/schema.png)

## Testing

### How to run the test suite

    $ rspec


### Other gems / libraries used when testing

* [Capybara](https://github.com/teamcapybara/capybara)

* [FactoryGirl](https://github.com/thoughtbot/factory_girl)

* [Faker](https://github.com/stympy/faker)

* [Warden](https://github.com/hassox/warden/wiki)

## Deployment

* [Heroku](https://...herokuapp.com/)

>https://...herokuapp.com/

## License

HawkSet is released under the [MIT License](https://opensource.org/licenses/MIT).
