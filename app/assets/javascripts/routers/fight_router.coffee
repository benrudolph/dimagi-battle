class DimagiBattle.Routers.FightRouter extends Backbone.Router

  initialize: (options) ->

  routes:
    '*default': 'index'

  index: () =>
    console.log 'index'

    @fightView = new DimagiBattle.Views.UserFight
      el: $('#fight')
      user1: DimagiBattle.manager.get('user1')
      user2: DimagiBattle.manager.get('user2')
    @fightView.render()
