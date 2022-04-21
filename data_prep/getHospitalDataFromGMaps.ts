import axios from 'axios'
import { config } from 'dotenv'
import { readJSONSync, writeFileSync } from 'fs-extra'
import { HospitalFormatted } from '.'

config()

const BASE_URL = 'https://maps.googleapis.com/maps/api/place/textsearch/json'

const main = async () => {
  const hospitalData = readJSONSync('./hospitalFormattedData.json') as Array<HospitalFormatted>

  const hospitalFetchData: Record<string, any> = {}

  for (const [i, hospital] of hospitalData.entries()) {
    console.log(i + 1, hospital.id)
    const { data: infoPage } = await axios.get(BASE_URL, {
      params: {
        query: hospital.name,
        key: process.env.GOOGLE_MAPS_API_KEY,
        language: 'en',
      },
    })
    const results = infoPage.results
    console.log(`  Found Results of ${hospital.name}:`, results.length)

    hospitalFetchData[hospital.id] = results

    // break
  }

  // console.log(Object.keys(Object.values(hospitalFetchData)[0]))
  writeFileSync('./hospitalGMapsDataEN.json', JSON.stringify(hospitalFetchData, null, 2))
}

main()
