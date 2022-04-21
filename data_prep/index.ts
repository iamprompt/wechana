import faker from '@faker-js/faker'
import { readJSONSync, writeFileSync } from 'fs-extra'

export interface HospitalOriginal {
  hospitalName: string
  tel: string
  district: string
  subDistrict: string
  map: string
  id: string
  region: string
  province: string
}

interface LocalizedString {
  en: string
  th: string
}

export interface HospitalFormatted {
  id: string
  name: LocalizedString
  tel: Array<string>
  district: LocalizedString
  subDistrict: LocalizedString
  region: LocalizedString
  province: LocalizedString
  totalBed: number
}

const main = async () => {
  const hospitalOriginalData = readJSONSync('./hospitalOriginalData.json') as Array<HospitalOriginal>
  const hospitalTranslate = readJSONSync('./hospitalTranslate.json') as Record<string, string>
  const regionTranslate = readJSONSync('./regionTranslate.json') as Record<string, string>
  const proviceTranslate = readJSONSync('./provinceTranslate.json') as Record<string, string>
  const districtTranslate = readJSONSync('./districtTranslate.json') as Record<string, string>
  const subDistrictTranslate = readJSONSync('./subDistrictTranslate.json') as Record<string, string>

  const formattedData: HospitalFormatted[] = hospitalOriginalData.map((data) => {
    // return {
    //   ...data,
    //   tel: data.tel === '' ? null : data.tel.split(','),
    //   province: province[data.province],
    //   district: district[data.district],
    //   subDistrict: subDistrict[data.subDistrict],
    //   region: region[data.region],
    //   total_bed: Math.round(Math.random() * 250),
    // }
    return {
      id: data.id,
      name: {
        th: data.hospitalName,
        en: hospitalTranslate[data.hospitalName] ?? undefined,
        slug: proviceTranslate[data.province].toLowerCase().replace('(', '').replace(')', '').split(' ').join('-'),
      },
      tel: data.tel === '' ? null : data.tel.split(','),
      province: {
        th: data.province,
        en: proviceTranslate[data.province] ?? undefined,
        slug: proviceTranslate[data.province].toLowerCase().replace('(', '').replace(')', '').split(' ').join('-'),
      },
      district: {
        th: data.district,
        en: districtTranslate[data.district] ?? undefined,
        slug: districtTranslate[data.district].toLowerCase().replace('(', '').replace(')', '').split(' ').join('-'),
      },
      subDistrict: {
        th: data.subDistrict,
        en: subDistrictTranslate[data.subDistrict] ?? undefined,
        slug: subDistrictTranslate[data.subDistrict]
          .toLowerCase()
          .replace('(', '')
          .replace(')', '')
          .split(' ')
          .join('-'),
      },
      region: {
        th: data.region,
        en: regionTranslate[data.region] ?? undefined,
        slug: regionTranslate[data.region].toLowerCase().replace('(', '').replace(')', '').split(' ').join('-'),
      },
      totalBed: faker.random.number(250),
    } as HospitalFormatted
  })

  console.log(formattedData)

  writeFileSync('./hospitalFormattedData.json', JSON.stringify(formattedData, null, 2))
}

main()
