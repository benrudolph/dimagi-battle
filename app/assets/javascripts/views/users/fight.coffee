class DimagiBattle.Views.UserFight extends Backbone.View

  template: JST['users/fight']

  initialize: (options) ->
    super
    @user1 = options.user1
    @user2 = options.user2

  metrics: [
    {
      name: 'nUpdates'
      human: 'Number of updates'
      label: ''
    },
    {
      name: 'distance'
      human: 'Miles traveled'
    },
    {
      name: 'countries'
      human: 'Countries Visited'
    },
    {
      name: 'cities'
      human: 'Cities Visited'
    }
  ]

  render: =>

    winner = DimagiBattle.Utils.winner(@user1, @user2, @metrics)
    console.log winner

    @$el.html @template
      metrics: @metrics
      user1: @user1
      user2: @user2
      winner: winner




