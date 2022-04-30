export interface WongnaiBusiness {
  isOwner: boolean
  id: number
  gid: string
  publicId: string
  nameOnly: NameOnly
  branch: Branch
  url: string
  shortUrl: string
  rUrl: string
  rShortUrl: string
  photosUrl: string
  verifiedInfo: boolean
  verifiedLocation: boolean
  domain: Domain
  lat: number
  lng: number
  zipcode: string
  priceRange: Domain
  newBusiness: boolean
  name: string
  displayName: string
  logo: CoverPhoto
  categories: Category[]
  defaultPhoto: CoverPhoto
  targetViewGroupId: number
  isThailand: boolean
  businessTags: any[]
  rating: number
  mainPhoto: CoverPhoto
  coverPhoto: CoverPhoto
  defaultPromotionPhoto: CoverPhoto
  workingHoursStatus: WorkingHoursStatus
  official: boolean
  premium: boolean
  statistic: WongnaiBusinessStatistic
  closed: boolean
  completeness: number
  dealsUrl: string
  neighborhoods: string[]
  contact: Contact
  topFavourites: TopFavourite[]
  logoUrl: string
  ranking: Ranking
  menu: Menu
  photos: WongnaiBusinessPhotos
  workingHours: WorkingHour[]
  hours: Hour[]
  parkingType: ParkingType
  creditCardAccepted: boolean
  goodForGroups: boolean
  delivery: boolean
  wifi: Wifi
  numberOfSeats: Domain
  nearbyPlaces: any[]
  additionalInformation: string
  inServiceRegion: boolean
  inServiceRegion2: boolean
  breadcrumbs: Breadcrumb[]
  chain: Chain
  goodFors: GoodFor[]
  listings: Listing[]
  favouriteMenus: WongnaiBusinessFavouriteMenu[]
  markAsBeenHere: boolean
  canAddMenu: boolean
  deliveryInformation: DeliveryInformation
  rms: RMS
  promotionStatistic: PromotionStatistic
  crm: boolean
  eatigoLink: null
  navigationUrl: null
  cloudKitchen: boolean
  serviceModel: ServiceModel
  _wtm: Wtm
  pickupInformation: PickupInformation
  hasPreventiveMeasures: boolean
  socialMenuRestaurant: boolean
  hotelAvailability: HotelAvailability
  trips: Trips
  promotions: Promotions
  deliveryPromotions: any[]
  openHourMessage: string
  highlightKeywords: HighlightKeyword[]
  redeemItems: null
  advertisement: null
  additionalAttributes: AdditionalAttributes
}

export interface Wtm {
  resultEntryId: string
}

export interface AdditionalAttributes {}

export interface Branch {
  primary: string
}

export interface Breadcrumb {
  title: string
  url: string
}

export interface Category {
  id: number
  name: string
  internationalName: string
  iconUrl: string
  iconFullUrl: string
  nicePhoto: CoverPhoto
  domain: Domain
}

export interface Domain {
  name: string
  value: number
}

export interface Product {
  id: number
  primaryName: string
  name: string
  photo: CoverPhoto
  price: AdditionalAttributes
  featured: boolean
  count: number
  numberOfOrders: number
  score: number
  deliveryAllowed: boolean
  outOfStock: boolean
  numberOfPhotos: number
  url: string
  photosUrl: string
  reviewsUrl: string
}

export interface CoverPhoto {
  photoId: string
  url: string
  description?: string
  contentUrl: string
  width?: number
  height?: number
  photoUrl: string
  thumbnailUrl: string
  smallUrl: string
  largeUrl: string
  product?: Product
}

export interface Chain {
  id: number
  displayName: string
  description: string
  url: string
  businessesUrl: string
  photosUrl: string
  featured: boolean
  logo: CoverPhoto
  categories: Category[]
  favouriteMenus: ChainFavouriteMenu[]
  domain: Domain
}

export interface ChainFavouriteMenu {
  id: number
  primaryName: string
  name: string
  price: AdditionalAttributes
  featured: boolean
  count: number
  numberOfOrders: number
  score: number
  deliveryAllowed: boolean
  outOfStock: boolean
}

export interface Contact {
  address: Address
  facebookHomepage: string
  callablePhoneno: string
  callablePhoneNumbers: string[]
  phoneno: string
}

export interface Address {
  street: string
  hint: string
  subDistrict: City
  district: City
  city: City
}

export interface City {
  id: number
  name: string
}

export interface DeliveryInformation {
  delivery: boolean
  gp: boolean
  gpMode: Domain
  gpInformation: GpInformation
  eco: boolean
  inServiceRegion: boolean
  inServiceRegion2: boolean
  goodForFoodOrdering: boolean
  hasDeliveryService: boolean
  cartSizes: CartSizes
}

export interface CartSizes {
  CASH: number
  RLP: number
  EPAYMENT: number
}

export interface GpInformation {
  deliveryPrice: number
  deliveryPriceMaxDistance: number
}

export interface WongnaiBusinessFavouriteMenu {
  id: number
  primaryName: string
  name: string
  photo?: CoverPhoto
  price: Price
  featured: boolean
  count: number
  numberOfOrders: number
  score: number
  deliveryAllowed: boolean
  outOfStock: boolean
  numberOfPhotos: number
  url: string
  photosUrl: string
  reviewsUrl: string
}

export interface Price {
  exact?: number
  text?: string
}

export interface GoodFor {
  name: string
  percentage: number
  icon: Icon
}

export interface Icon {
  url: string
  width: number
  height: number
}

export interface HighlightKeyword {
  url: string
  fullUrl: string
  keyword: string
}

export interface HotelAvailability {
  id: string
  hasAgency: boolean
}

export interface Hour {
  day: number
  from: string
  to: string
}

export interface Listing {
  id: number
  url: string
  title: string
  socialTitle: string
  picture: CoverPhoto
  highlightPicture: CoverPhoto
  by: FirstReviewer
  shortDescription: string
  description: string
  addedTime: Time
  lastUpdatedTime: Time
  locationBased: boolean
  domain: Domain
  statistic: ListingStatistic
  tags: Tag[]
  campaign?: Campaign
}

export interface Time {
  iso: Date
  full: string
  timePassed: string
}

export interface FirstReviewer {
  id: string
  gid: string
  isEditor: boolean
  url: string
  name: string
  me: boolean
  contentUrl: string
  profilePicture: ProfilePicture
  profilePictureLayers: any[]
  rank?: Rank
  joinTime: Time
  statistic: { [key: string]: number }
  aboutMe: string
  thumbnailUrl: string
  photoUrl: string
  largeUrl: string
  phoneVerified?: boolean
  isFollowing?: boolean
  isBlocking?: boolean
}

export interface ProfilePicture {
  url: string
  contentUrl: string
  thumbnailUrl: string
  smallUrl: string
  largeUrl: string
  uploaded: boolean
}

export interface Rank {
  name: string
  value: number
  url: string
  iconUrl: string
}

export interface Campaign {
  name: string
  url: string
  id: number
  eid: string
  title: string
  discountTitle: string
  visible: boolean
  redeemable: boolean
  description: string
  campaignUrl: string
  campaignColor: string
  textColor: string
  icon: Icon
  logo: Icon
  bannerMobile: Icon
  bannerDesktop: Icon
  transparentLogo: Icon
  backgroundPhoto: Icon
}

export interface ListingStatistic {
  numberOfViews: string
}

export interface Tag {
  id: string
  title: string
  url: string
  statistic: TagStatistic
}

export interface TagStatistic {
  numberOfArticles: number
  numberOfListings: number
  numberOfBusinesses: number
}

export interface Menu {
  texts: Texts
  photos: MenuPhotos
}

export interface MenuPhotos {
  url: string
  updatedTime: Time
}

export interface Texts {
  url: string
  numberOfItems: number
  updatedTime: Time
  groupsUrl: string
}

export interface NameOnly {
  primary: string
  thai: string
  english: string
}

export interface ParkingType {
  id: number
  name: string
  remark: string
}

export interface WongnaiBusinessPhotos {
  page: Page
  query: Query
}

export interface Page {
  pageInformation: PageInformation
  first: number
  last: number
  totalNumberOfPages: number
  totalNumberOfEntities: number
  entities: CoverPhoto[]
}

export interface PageInformation {
  number: number
  size: number
}

export interface Query {
  url: string
  fullUrl: string
  pathOnly: string
  params: Param[]
}

export interface Param {
  name: string
  value: string
}

export interface PickupInformation {
  available: boolean
}

export interface PromotionStatistic {
  numberOfVisibleVouchers: number
  numberOfLinemanDeliveryPromotions: number
}

export interface Promotions {
  url: string
  entities: any[]
}

export interface Ranking {
  rank: number
  numberOfBusinesses: number
  text1: string
  text2: string
  searchQuery: SearchQuery
}

export interface SearchQuery {
  name: string
  url: string
  path: string
  params: Param[]
}

export interface RMS {
  ePayment: boolean
  acceptingOrder: boolean
  usingMenuStructure: boolean
  temporaryClosed: boolean
}

export interface ServiceModel {
  kitchenOnly: boolean
  kitchenOnlyDelivery: boolean
  kitchenOnlyPickup: boolean
  message: null
}

export interface WongnaiBusinessStatistic {
  numberOfBookmarks: number
  numberOfPhotos: number
  numberOfUserPhotos: number
  rating: number
  numberOfReviews: number
  showRating: boolean
  numberOfRatings: number
  numberOfVideos: number
  numberOfEditorialReviews: number
  numberOfSponsoredReviews: number
  numberOfCheckins: number
  numberOfMarkAsBeenHeres: number
  numberOfUniqueCheckins: number
  numberOfFavouriteMenus: number
  numberOfDistinctDeals: number
  numberOfVisibleDeals: number
  ratingDistribution: RatingDistribution
  firstReviewer: FirstReviewer
}

export interface RatingDistribution {
  one: number
  two: number
  three: number
  four: number
  five: number
}

export interface TopFavourite {
  name: string
}

export interface Trips {
  page: Page
}

export interface Wifi {
  value: number
  name: string
  remark: string
}

export interface WorkingHour {
  day: string
  period: string[]
}

export interface WorkingHoursStatus {
  open: boolean
  message: string
  closingSoon: boolean
}
