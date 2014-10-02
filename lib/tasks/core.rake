namespace :stream do
  task :twitter => :environment do

    require 'tweetstream'
    require 'rest_client'

    TweetStream.configure do |config|
      config.consumer_key = 'id5f9DrH79n5Nxa7E7cd0N8Ol'
      config.consumer_secret = 'eESkyMqDh7v5yTdwwOPaAqaiykc17wKZz0qXs4raRX6QnroZY4'
      config.oauth_token = '456173542-xsY9G3vKnEWBJlLA7hFsaBNVwOK1p3eZXeTABUZx'
      config.oauth_token_secret = 'gfTlZ1AgvXFMNScf76b5s6hdY3X7sqhCtEZ1yNjI62SS4'
      config.auth_method        = :oauth
    end

    client = TweetStream::Client.new

    client.on_error do |message|
  	  puts message
  	end
    # This will pull a sample of all tweets based on
    # your Twitter account's Streaming API role.
    client.track('#dimagibattle') do |status|
      # The status object is a special Hash with
      # method access to its keys.
      # Geo
      # place_type
      # name
      username = status.user.username
      name = status.user.name

      if status.place? and status.place.place_type == 'city'
        place = status.place
        response = RestClient.get 'api.geonames.org/searchJSON', :params => {
          :q => "#{place.full_name}, #{place.country_code}",
          :username => 'dimagi',
          :max_rows => 10
        }
        results = JSON.parse(response)
        require 'pry'; binding.pry

        if results['totalResultsCount'] > 0 and results['geonames'][0].present?
          result = results['geonames'][0]

          l = Location.create({
            :lat => result['lat'],
            :lng => result['lng'],
            :country => result['countryName'],
            :city => result['name'],
            :iso2 => result['adminCode1'],
            :population => result['population'],
            :username => username,
            :name => name,
            :status => status.text
          })

          p "Created location for #{l.username} at #{l.city}"
        end
      end
    end
  end
end

task :random_locations => :environment do
  name = ENV['name']

  (0..2).each do |i|
    lat = (rand - 0.5) + 10
    lng = (rand - 0.5) + 10
    p lat
    p lng
    response = RestClient.get 'api.geonames.org/findNearbyPlaceNameJSON', :params => {
        :lat => lat,
        :lng => lng,
        :username => 'dimagi',
        :max_rows => 10
      }
    results = JSON.parse(response)
    p results

    if results['geonames'].length > 0 and results['geonames'][0].present?
      result = results['geonames'][0]

      l = Location.create({
        :lat => lat,
        :lng => lng,
        :country => result['countryName'],
        :city => result['name'],
        :iso2 => result['adminCode1'],
        :population => result['population'],
        :username => name,
        :name => 'Random',
        :status => 'Randomly generated'
      })

      p "Created location for #{l.username} at #{l.city}"
    end
  end

end

