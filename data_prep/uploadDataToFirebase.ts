import { FieldValue, GeoPoint } from 'firebase-admin/firestore'
import { readJSONSync } from 'fs-extra'
import { db } from './firebaseAdmin'

interface LocalizedString {
  en: string
  th: string
}

interface Hospital {
  id: string
  name: LocalizedString
  tel: Array<string>
  province: LocalizedString
  district: LocalizedString
  subDistrict: LocalizedString
  total_bed: number
  geolocation: {
    lat: number
    lng: number
    geohash: string
  }
  googleMapsPlaceId: string
  googleMapsPlusCode: string
  address: LocalizedString
}

const main = async () => {
  const hospitals = readJSONSync('./hospitals-1.json') as Array<Hospital>

  // console.log(hospitals)

  const batch = db.batch()

  for (const hospital of hospitals) {
    const docRef = db.collection('hospitals').doc(hospital.id)
    const newDocs = {
      ...hospital,
      geolocation: new GeoPoint(hospital.geolocation.lat, hospital.geolocation.lng),
      total_bed: FieldValue.delete(),
    }

    if (hospital.geolocation.geohash) {
      newDocs['position'] = {
        geopoint: newDocs.geolocation,
        geohash: hospital.geolocation.geohash,
      }
    }

    batch.update(docRef, newDocs)
  }

  await batch.commit()
}

main()
