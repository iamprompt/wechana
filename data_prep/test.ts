import { readJSONSync } from 'fs-extra'

const hospitalGMapsDataTH = readJSONSync('./hospitalGMapsDataEN.json') as Record<
  string,
  Array<google.maps.places.PlaceResult>
>

console.log(
  Object.entries(hospitalGMapsDataTH).map(([id, h]) => {
    h.length > 1 && console.log(id)

    return h.length
  })
)
