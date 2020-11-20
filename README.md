# PrayerJournal

This web app is used to create a journal for users to log in every day. This web app also contains a prayer wall so users can contribute prayers that they want everyone to pray for. This web application was developed using Sinatra with the following features:

* Persists user’s journal entries using ActiveRecord one-to-many associations to postgreSQL database.
* Allows users to signup and login to the web application.
* Utilizes model-view-controller design pattern for object relational mapping.
* Encrypts user login data persisting salted and hashed password in postgreSQL database.
* Uses ActiveRecord model to validate user and journal entry data.

This app can be found via Heroku [here](https://prayerjournals.herokuapp.com/). A walkthrough can be found in [youtube](https://www.youtube.com/watch?v=zZKlddr2upE&t=8s)

[![prayer journal](http://img.youtube.com/vi/zZKlddr2upE/0.jpg)](http://www.youtube.com/watch?v=zZKlddr2upE)

## Installation

download or clone this project
cd into the prayer_journal directory
run bundle install in your console
run db:migrate
run shotgun
open your favorite browser and enter the given local url provided by the shotgun server!

## Usage

Perform CRUD actions on journal entries and prayer wall requests. 


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[ting682]/prayer_journal. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[ting682]/prayer_journal/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the CliAdoptPet project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[ting682]/prayer_journal/CODE_OF_CONDUCT.md).
