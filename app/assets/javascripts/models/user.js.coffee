class DimagiBattle.Models.User extends Backbone.Model

  nUpdates: ->

    @get('locations').length

  distance: ->
    meters = 0

    @get('locations').each (l, i, list) ->
      if i > 0
        prev = list[i - 1]

        meters += DimagiBattle.Utils.haversineDistance l, prev

    miles = (meters * 0.000621371).toFixed()

    +miles

  countries: ->
    _.uniq(@get('locations').pluck 'country').length

  cities: ->
    _.uniq(@get('locations').pluck 'city').length

  longestStay: ->
    0

  totalScore: (metrics) ->

    _.each metrics, (metric) ->
      @[metric.name]()




