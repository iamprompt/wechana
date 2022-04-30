import axios from 'axios'
import { readJSONSync, writeFileSync } from 'fs-extra'
import { WongnaiBusiness } from './wongnaiBusinessType'
import { Wongnai } from './wongnaiType'

const main = async () => {
  const wongnaiCafeJSON = readJSONSync('wongnaiCafe.json') as Wongnai

  const publicIds = wongnaiCafeJSON.page.entities.map((entity) => entity.business?.publicId).filter(Boolean)

  // console.log(publicIds)
  const result: Record<string, any> = {}

  for (const [i, publicId] of publicIds.entries()) {
    const loggerPrefix = `[${i + 1}:${publicId}]`
    try {
      const { data } = await axios.get<WongnaiBusiness>(
        `https://www.wongnai.com/_api/businesses/${publicId}.json?locale=en`,
        {
          headers: {
            'User-Agent':
              'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36',
            cookie:
              '_gcl_au=1.1.1398306089.1650567267; _wna_ref.wn.2b35=["","","","","",1650567267,"https://www.google.com/"]; _wna_ses.wn.2b35=1; _ga=GA1.2.155782430.1650567267; _gid=GA1.2.808477214.1650567267; __utma=40974884.155782430.1650567267.1650567267.1650567267.1; __utmc=40974884; __utmz=40974884.1650567267.1.1.utmcsr=google|utmccn=(organic)|utmcmd=organic|utmctr=(not provided); afUserId=3ffaaa00-2945-4550-b4b5-5a8538b11242-p; AF_SYNC=1650567268411; c_behavior=19; c_promo=20; c_personalize=21; wngwc=xhdtEtOFK7ZafM2VasqE83R0oE-2PK0c5qfSgD7PNcWCNywOwLVtq9ibpukLYqrs0dbLSJzkgJiXoVJLRAbm-vV0d6pWLjrsfo5kqHeofXPbGId94fvF7sVht0uM09w0JGh8X7ru9HnFpUSAuwKugm9Kx-o; ws=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJfdCI6MTY1MDU3MDA1MDQxMywiX2UiOjE2NTA1NzEyNTA0MTMsIl9pIjoidGFiZG83Nm51ODhzbzF1MnJxMmY4MHJnbiIsImwiOiJ0aCJ9.O8ONVMFiuaiFMgRAOVc_0_qMwJmdMT-Nlo1j035YqkM; __cf_bm=ioDz86DdDxi._CwFC.QEo8UlCehdvfMqavcVbcwxws8-1650570051-0-ASu6FQyYW61utP42bsJWHlcAigxu8AGaDfyv2Ou9wUF3j2Ez+oGvEf5Donj0m8qjuAxd3v3h6AlW8Lxe78KUcZ9ojcNPspuCBOoFjP3RpHiPqeqjxGiNIraF15L/czSLcw==; _wna_id.wn.2b35=64f39bd7-ca92-4007-905e-83cc906d56b2.1650567267.1.1650570054.1650567267.; __utmt_UA-18335606-1=1; __utmb=40974884.23.10.1650567267; _dc_gtm_UA-18335606-11=1',
          },
        }
      )

      const r = {
        name: data.name,
        geolocation: {
          lat: data.lat,
          lng: data.lng,
        },
        address: `${data.contact?.address?.street} ${data.contact?.address?.subDistrict?.name} ${data.contact?.address?.district?.name} ${data.contact?.address?.city?.name} ${data.zipcode}`,
        phone: data.contact.callablePhoneNumbers,
        priceRange: data.priceRange,
        logo: data.logo?.largeUrl,
        cover: data.coverPhoto?.largeUrl,
        primaryImage: data.mainPhoto?.largeUrl,
        recommendedMenu: data.topFavourites.map((item) => item.name),
      }

      console.log(loggerPrefix, r)
      result[publicId] = r
      // break
    } catch (error) {
      console.log(loggerPrefix, error.response.data)
    }

    await new Promise((resolve) => setTimeout(resolve, 1000))
    writeFileSync('wongnaiCafe-result.json', JSON.stringify(result, null, 2))
  }
}

main()
