import { readJSONSync } from 'fs-extra'

interface LocalizedString {
  en: string
  th: string
  slug: string
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
  region: LocalizedString
}

const hospitals = readJSONSync('./hospitals-1.json') as Array<Hospital>

const d = hospitals.reduce((acc, hospital) => {
  return {
    ...acc,
    [hospital.region.slug]: {
      ...acc[hospital.region.slug],
      [hospital.province.slug]: hospital.province.en,
    },
  }
}, {})

for (const [region, provinces] of Object.entries(d)) {
  console.log(`Region(slug: '${region}', name: 'Central', provinces: [`)
  for (const [province, provinceName] of Object.entries(provinces)) {
    console.log(`  Province(slug: '${province}', name: '${provinceName}'),`)
  }
  console.log(`  ]),`)
}
