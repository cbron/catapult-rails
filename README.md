# catapult-rails


## Installation

Add this line to your application's Gemfile:

    gem 'catapult-rails', :require => "catapult"

And then execute:

    $ bundle

Finally, add this to one of your initliazation files

    Catapult.username = "c@apult.com"
    Catapult.password = "MyShinyPassword"

## Usage

The gem should explicitly follow [the api](http://client.vibes.com/toolkit/api/update-subscriber.shtml). 

For example under the subscription section we have a create subscription method.To call this method use: 

    Catapult::Subscription.create_subscription(campaign_id, phone)


Finished:

* Subscription.list_subscribers(campaign)
* Subscription.create_subscription(campaign, phone)
* Subscription.delete_subscriber(campaign, phone, suppress_message)
* Subscription.update_subscriber(campaign, phone, opts = {})



## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request