*UserStory*

The test is as follows:

1. ruby_app
Write a ruby script that:

a. Receives a log as argument (webserver.log is provided)
  e.g.: ./parser.rb webserver.log

b. Returns the following:
> list of webpages with most page views ordered from most pages views to less page views
  e.g.:
  /home 90 visits /index 80 visits etc... > list of webpages with most
  unique page views also ordered
  e.g.:
  /about/2 8 unique views
  /index 5 unique views etc...

*RUN:*
  bundle install
  ruby lib/parser.rb webserver.log


*Output*

-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
| # |      Page Views
-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
| 1 | /about/2 has 90 visits
| 2 | /contact has 89 visits
| 3 | /index has 82 visits
| 4 | /about has 81 visits
| 5 | /help_page/1 has 80 visits
| 6 | /home has 78 visits

-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
| # |    Unique Views
-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
| 1 | /index has 23 unique views
| 2 | /home has 23 unique views
| 3 | /contact has 23 unique views
| 4 | /help_page/1 has 23 unique views
| 5 | /about/2 has 22 unique views
| 6 | /about has 21 unique views

