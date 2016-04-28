# TwitterScraper

The TwitterScraper app is designed to capture the tweets of users who, for whatever reason, are at risk of suspension.

 It connects to Twitter's API through the TwitterClient model, captures their 20 most recent tweets, and displays them on both the index and account_show pages.

 Using the twitter gem, we can capture up to 200 of an account's most recent tweets, and store up to 3,200 (though an account on this list is unlikely to last that long).

 Thanks to Heroku's scheduler addon, the app will automatically fetch fresh tweets from each account every 10 minutes (while filtering out duplicates).

 Future updates (coming soon!) will display the tweet's full front end, rather than simply the text, created_at, and username attributes.

Enjoy!
