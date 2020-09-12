# README
1. required ruby version 2.6.3
2. clone this app
3. run bundle install
4. run rails db:migrate note: before this create master.key in ./config (reach out to me for key)
4. run rails s
5. visit http://localhost:3000

Below are the test to check test coverage
1. After successfully running the app run `rails test`
2. To check the coverage of entire code in mac run `open coverage/index.html` and in ubuntu run `xdg-open coverage/index.html`
3. You can also find the test coverage in `./coverage/index.html`
