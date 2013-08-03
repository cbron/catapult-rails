# catapult-rails


## Installation

Add this line to your application's Gemfile:

    gem 'catapult-rails', :require => "catapult"

And then execute:

    $ bundle

Finally, add this to any of your initliazation files

    Catapult.username = "c@apult.com"
    Catapult.password = "MyShinyPassword"

## Usage

The gem should explicitly follow [the api](http://client.vibes.com/toolkit/api/update-subscriber.shtml). 

For example under the subscription section we have a create subscription method.To call this method use: 

    Catapult::Subscription.create_subscription(campaign_id, phone)


Finished:

* list_subscribers(campaign)
* create_subscription(campaign, phone)
* delete_subscriber(campaign, phone, suppress_message)
* update_subscriber(campaign, phone, opts = {})



## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request