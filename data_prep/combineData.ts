import { readJSONSync, writeFileSync } from 'fs-extra'
import { HospitalFormatted } from '.'
import { TCentralData } from './getHospitalDataFromHCode'
import { geohashForLocation } from 'geofire-common'

const main = async () => {
  const hospitalData = readJSONSync('./hospitalFormattedData.json') as Array<HospitalFormatted>
  const gMapsTH = readJSONSync('./hospitalGMapsDataTH.json') as Record<string, Array<google.maps.places.PlaceResult>>
  const gMapsEN = readJSONSync('./hospitalGMapsDataEN.json') as Record<string, Array<google.maps.places.PlaceResult>>
  const centralInfo = readJSONSync('./hospitalFetchData.json') as Record<string, TCentralData>

  const hospitals = hospitalData.map((hospital) => {
    const gMapsTHData = gMapsTH[hospital.id]
    const gMapsENData = gMapsEN[hospital.id]
    const centralData = centralInfo[hospital.id]

    const lat = gMapsTHData[0]?.geometry.location.lat as unknown as number
    const lng = gMapsTHData[0]?.geometry.location.lng as unknown as number
    const geohash = geohashForLocation([lat, lng])

    return {
      ...hospital,
      totalBed: parseInt(centralData.total_bed, 10),
      name: {
        ...hospital.name,
        th: gMapsTHData[0]?.name ?? hospital.name.th,
        en: gMapsENData[0]?.name ?? hospital.name.en,
      },
      tel: Array.from(
        new Set([
          ...(hospital.tel || []),
          gMapsTHData[0]?.formatted_phone_number,
          gMapsENData[0]?.formatted_phone_number,
        ])
      ).filter((tel) => tel),
      geolocation: {
        lat,
        lng,
        geohash: lat && lng ? geohash : undefined,
      },
      googleMapsPlaceId: gMapsTHData[0]?.place_id,
      googleMapsPlusCode: gMapsTHData[0]?.plus_code?.global_code,
      address: {
        th: gMapsTHData[0]?.formatted_address,
        en: gMapsENData[0]?.formatted_address,
      },
    }
  })

  console.log(hospitals)

  writeFileSync('./hospitals-1.json', JSON.stringify(hospitals, null, 2))
}

main()
