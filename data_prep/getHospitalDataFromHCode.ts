import axios from 'axios'
import { readFileSync, readJSONSync, writeFileSync } from 'fs-extra'
import { HospitalFormatted } from '.'
import { load } from 'cheerio'

const BASE_URL = 'http://203.157.10.8/hcode_2020/healthlog_detail.php'

export type TCentralData = {
  [key in Key]: string
}

enum Key {
  'รหัส 9 หลัก' = 'hID_New',
  'รหัส 5 หลัก' = 'hID',
  'รหัสกองประกอบโรคศิลปะ (11หลัก)' = 'licenseCode',
  'ชื่อหน่วยงาน' = 'name',
  "จำนวนเตียงผู้ป่วย (Patient's Bed)" = 'total_bed',
  'ที่อยู่' = 'address',
  'โทรศัพท์' = 'tel',
  'ประเภทหน่วยบริการ' = 'type',
  'สังกัด' = 'affiliation',
  'ระดับสถานบริการ' = 'level',
  'พิกัดทางภูมิศาสตร์UTM Zone' = 'utm_zone',
  'Longitude' = 'longitude',
  'Latitude' = 'latitude',
  'North' = 'north',
  'East' = 'east',
  'วันที่กำหนดรหัส' = 'hID_date',
  'วันที่ยกเลิกรหัส' = 'hID_cancel_date',
  'สถานะการเปิดบริการ' = 'status',
  'หมายเหตุ' = 'remark',
  'วันที่แก้ไขข้อมูลล่าสุด' = 'last_update',
}

const main = async () => {
  const hospitalData = readJSONSync('./hospitalFormattedData.json') as Array<HospitalFormatted>

  const hospitalFetchData: Record<string, any> = {}

  for (const [i, hospital] of hospitalData.entries()) {
    console.log(i + 1, hospital.id)
    const url = `${BASE_URL}?code=${hospital.id}`
    const { data: infoPage } = await axios.get(url)
    // console.log(infoPage)

    const $ = load(infoPage)
    const info = $('form[role=form]')

    const rows = info.find('.row')
    const rowRecord: Record<string, string> = {}
    for (const row of rows) {
      const rowData = $(row)
      const itemsInRow = rowData.find('div.form-group')
      for (const item of itemsInRow) {
        const itemData = $(item)
        const label = itemData.find('label').text().trim().replace(/\s+/g, ' ').replace(':', '')
        const value = itemData.find('p').text().trim().replace(/\s+/g, ' ')
        // console.log(label.trim(), 'v', value.trim())
        rowRecord[Key[label as keyof typeof Key]] = value ?? ''
      }
    }
    hospitalFetchData[hospital.id] = rowRecord

    // break
  }

  // console.log(Object.keys(Object.values(hospitalFetchData)[0]))
  writeFileSync('./hospitalFetchData.json', JSON.stringify(hospitalFetchData, null, 2))
}

main()
