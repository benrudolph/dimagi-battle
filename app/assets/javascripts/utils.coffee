DimagiBattle.Utils.haversineDistance = (l, l2) ->
  gju.pointDistance { type: 'Point', coordinates: [l.get('lng'), l.get('lat')] },
                    { type: 'Point', coordinates: [l2.get('lng'), l2.get('lat')] }

DimagiBattle.Utils.winner = (u1, u2, metrics) ->

  u1Score = 0
  u2Score = 0


  _.each metrics, (metric) ->
    v1 = u1[metric.name]()
    v2 = u2[metric.name]()

    if v1 > v2
      u1Score += 1
    else
      u2Score += 1

  if u1Score > u2Score then return u1 else return u2




