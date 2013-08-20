# catapult-rails


## Installation

Add this line to your application's Gemfile:

    gem 'catapult-rails', :require => "catapult"

And then execute:

    $ bundle

Finally, add this to one of your initliazation files

    Catapult.username = "c@apult.com"
    Catapult.password = "MyShinyPassword"

## Methods

The gem should explicitly follow [the api](http://client.vibes.com/toolkit/api/update-subscriber.shtml). 

For example under the subscription section we have a create_subscription method. To call this method use: 

    Catapult::Subscription.create_subscription(campaign_id, phone)


Finished:

* Campaign.list_campaigns(account_list=nil, status_filter=nil, type_filter=nil)
* Subscription.list_subscribers(campaign)
* Subscription.create_subscription(campaign, phone)
* Subscription.read_subscription(campaign, phone)
* Subscription.delete_subscriber(campaign, phone, suppress_message=false)
* Subscription.update_subscriber(campaign, phone, opts = {})

 *opts here mirrors the api also: {"first-name" => "Lisbeth"}


## Usage
One way to find a users subscriptions:

    @campaigns = Hash.new

    MyTextAlerts.all.each do |ta|
      sub = Catapult::Subscription.read_subscription(ta.campaign_id, phone_number)
      @campaigns[ta.campaign_id] = (sub['subscription'].blank? ? false : true)
    end

    puts @campaigns
    =>
    {
      12345 => false,
      23456 => true
    }

Create a subscription:

    Catapult::Subscription.create_subscription(campaign_id, phone_number)
    => true

Update a subscription:

As far as I can tell this does not create a subscription even though the docs imply that it does

    Catapult::Subscription.update_subscriber(campaign_id, phone_number, options)
    => true

Delete a subscription:

    Catapult::Subscription.delete_subscriber(campaign_id, phone_number)
    => true

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request