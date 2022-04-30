import { FieldValue, GeoPoint } from 'firebase-admin/firestore'
import { readJSONSync } from 'fs-extra'
import { geohashForLocation } from 'geofire-common'
import { db } from './firebaseAdmin'

interface wongnaiCafe {
  name: string
  geolocation: {
    lat: number
    lng: number
  }
  address: string
  phone: Array<string>
  priceRange: {
    name: string
    value: number
  }
  logo?: string
  cover?: string
  primaryImage?: string
  recommendedMenu: Array<string>
}

const main = async () => {
  const cafes = readJSONSync('./wongnaiCafe-result.json') as Record<string, wongnaiCafe>

  const batch = db.batch()

  for (const [id, cafe] of Object.entries(cafes)) {
    const docRef = db.collection('restaurants').doc(id)
    const newDocs = {
      ...cafe,
      geolocation: {
        geohash: geohashForLocation([cafe.geolocation.lat, cafe.geolocation.lng]),
        geopoint: new GeoPoint(cafe.geolocation.lat, cafe.geolocation.lng),
      },
    }

    batch.create(docRef, newDocs)
  }

  await batch.commit()
}

main()
