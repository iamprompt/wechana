export interface Wongnai {
  page: WongnaiPage
  query: WongnaiQuery
  region: null
  meta: Meta
  _wtm: WongnaiWtm
  themeCards: ThemeCards
}

export interface WongnaiWtm {
  searchId: string
}

export interface Meta {
  explaination: Explaination
  data: Data
}

export interface Data {
  q: string
  originalQ: string
  showingInstead: boolean
  domain: Domain
}

export interface Domain {
  name: string
  value: number
}

export interface Explaination {
  title: string
  originalTitle: string
  description: string
  keywords: string[]
}

export interface WongnaiPage {
  pageInformation: PageInformation
  first: number
  last: number
  totalNumberOfPages: number
  totalNumberOfEntities: number
  entities: PurpleEntity[]
}

export interface PurpleEntity {
  type: number
  title: null | string
  business?: Business
  listings?: Listing[]
}

export interface Business {
  isOwner: boolean
  id: number
  eid: null | string
  gid: string
  publicId: string
  nameOnly: NameOnly
  branch: NameOnly | null
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
  openingDate: null
  name: string
  displayName: string
  chain: Chain | null
  logo: DefaultPhoto | null
  categories: Category[]
  defaultPhoto: DefaultPhoto
  place: Place | null
  placeInformation: PlaceInformation | null
  targetViewGroupId: number
  isThailand: boolean
  businessTags: any[]
  rating: number
  mainPhoto: DefaultPhoto
  workingHoursStatus: WorkingHoursStatus
  hours: Hour[]
  official: boolean
  premium: boolean
  portraitMode: null
  portraitModeCoverPhoto: DefaultPhoto | null
  featured: null
  featuredId: null
  featuredTarget: null
  trackingRef: null
  featuredMessage: null
  iconFeatured: null
  usersChoice: UsersChoice | null
  _ltr: null
  statistic: BusinessStatistic
  video: Video | null
  distance: null
  pickupInformation: PickupInformation
  hasPreventiveMeasures: boolean
  contact: Contact
  bestDiscountDeal: TDeal | null
  bestSellingDeal: null
  closed: boolean
  completeness: number
  dealsUrl: string
  moveToUrl: null
  neighborhoods: string[] | null
  topFavourites: TopFavourite[]
  logoUrl: null | string
  ranking: Ranking | null
  menu: Menu
  photos: BusinessPhotos
  distinctDeals: TDeal[]
  hotelInformation: null
  attractionInformation: null
  deliveryInformation: DeliveryInformation
  deliveryWorkingHours: DeliveryWorkingHour[] | null
  rms: RMS | null
  deliveryPromos: any[] | null
  deliveryPromotions: DeliveryPromotion[] | null
  promotionStatistic: PromotionStatistic
  crm: boolean
  _wtm: BusinessWtm
  cloudKitchen: boolean
  parentCloudKitchen: null
  serviceModel: ServiceModel
  newToThemeCard: null
  callToActions: CallToAction[]
  additionalAttributes: AdditionalAttributes
}

export interface BusinessWtm {
  resultEntryId: string
}

export interface AdditionalAttributes {
  openForDineIn?: Coke
  messageToCustomers?: Coke
  measures?: Coke[]
  hpPrinterMerchant?: Coke
  governmentHalfHalfEnabled?: Coke
  governmentYcydEnabled?: Coke
  governmentCampaignEnabled?: Coke
  halfHalfDelivery?: Coke
  governmentCampaignForceDisabled?: Coke
  coke?: Coke
}

export interface Coke {
  eid: string
  valueInt: number
  title: string
  formType: number
  valueString?: string
}

export interface TDeal {
  id: number
  type: number
  title: string
  description: string
  url: string
  save: string
  photo: null
  picture: DefaultPhoto
  pictures: DefaultPhoto[]
  lastUpdatedTime: AddedTime
  startTime: AddedTime
  endTime: AddedTime
  expirationTime: AddedTime
  numberOfBusinesses: null
  location: null
  fullPrice: number
  price: number | null
  allowedCredit: number | null
  serviceChargePercent: number | null
  vatPercent: number | null
  discounts: Discount[] | null
  paymentDiscounts: any[] | null
  allDiscounts: Discount[] | null
  supportPhone: null | string
  faqUrl: null | string
  campaign: Campaign
  phoneNumber: null
  phoneNumber2: null
  remainingCoupons: null
  numberOfUsedCoupons: number | null
  maxNumberOfCoupons: null
  maxNumberOfCouponsPerOrder: number
  checkinRequired: boolean
  termOfService: string
  fineprint: string
  campaignBannerDesktop: DefaultPhoto
  dealItem: null
  featured: boolean
  externalDiscountUrl: null | string
  displayTag: null
  badges: null
  discountPercentage: number | null
  discountBaht: number | null
  hotScore: null
  flashSale: boolean
}

export interface Discount {
  icon: null
  description: Description
  expirationTime: AddedTime
  discountCampaign: DiscountCampaign
}

export interface Description {
  normal: string
  full: string
  short: string
}

export interface DiscountCampaign {
  gid: string
  picture: Picture
  name: string
  ownerName: string
  url: null
}

export interface Picture {
  externalId: null
  width: number
  height: number
  description: string
  thumbnailUrl: string
  contentUrl: string
  uploadedDate: null
  deletionTime: null
}

export interface AddedTime {
  iso: Date
  full: string
  timePassed: string
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
  icon: SmallLabelImage
  logo: SmallLabelImage | null
  bannerMobile: SmallLabelImage
  bannerDesktop: SmallLabelImage
  signaturePhoto: SmallLabelImage | null
}

export interface SmallLabelImage {
  url: string
  trailingText?: null
  width: number
  height: number
}

export interface DefaultPhoto {
  photoId: string
  url: string
  description: null | string
  contentUrl: string
  width: number
  height: number
  photoUrl: string
  thumbnailUrl: string
}

export interface NameOnly {
  primary: string
  thai: null | string
  english: null | string
}

export interface CallToAction {
  type: number
  title: string
  subtitles: string[]
  buttonTitle: string
  count: number
  url: string
  extra: Extra | null
}

export interface Extra {
  price: number
  fullPrice: number
  numberOfUsedCoupons: number | null
  remainingCoupons: null
  flashSale: boolean
}

export interface Category {
  id: number
  name: string
  internationalName: string
  iconUrl: string
  iconFullUrl: string
  nicePhoto: DefaultPhoto | null
  domain: Domain
}

export interface Chain {
  id: number
  displayName: string
  description: string
  url: string
  businessesUrl: string
  photosUrl: string
  logo: DefaultPhoto | null
  domain: Domain
}

export interface Contact {
  address: Address
  businessno: null
  homepage: null | string
  facebookHomepage: null | string
  email: null | string
  callablePhoneno: null | string
  callablePhoneNumbers: string[] | null
  phoneno: null | string
  line: null | string
  instagram: null | string
}

export interface Address {
  street: string
  hint: string
  subDistrict: City | null
  district: City | null
  city: City
}

export interface City {
  id: number
  name: string
}

export interface DeliveryInformation {
  delivery: boolean | null
  gp: boolean
  gpInformation: GpInformation | null
  eco: boolean
  inServiceRegion: boolean
  inServiceRegion2: boolean
  goodForFoodOrdering: boolean
  hasDeliveryService: boolean
  cartSizes: CartSizes
  deliveryWorkingHoursStatus: DeliveryWorkingHoursStatus | null
  deliveryWorkingHours: DeliveryWorkingHour[] | null
}

export interface CartSizes {
  CASH: number
  RLP: number
}

export interface DeliveryWorkingHour {
  day: string
  period: string[]
}

export interface DeliveryWorkingHoursStatus {
  open: boolean
  message: string
}

export interface GpInformation {
  deliveryBasePrice: number
  deliveryPrice: null
  deliveryBasePriceRadius: number
  deliveryPriceMaxDistance: null
}

export interface DeliveryPromotion {
  id: number
  title: string
  businessId: number
  url: string
  discountedPrice: number | null
  imageUrl: null | string
  limitPerOrder: number
  endTime: AddedTime
}

export interface Hour {
  day: number
  from: string
  to: string
}

export interface Menu {
  texts: Texts | null
  photos: MenuPhotos | null
  previewedItems: null
}

export interface MenuPhotos {
  url: string
  updatedTime: AddedTime
}

export interface Texts {
  url: string
  numberOfItems: number
  updatedTime: AddedTime
  groupsUrl: string
}

export interface BusinessPhotos {
  page: PhotosPage
  query: PhotosQuery
}

export interface PhotosPage {
  pageInformation: PageInformation
  first: number
  last: number
  totalNumberOfPages: number
  totalNumberOfEntities: number
  entities: DefaultPhoto[]
}

export interface PageInformation {
  number: number
  size: number
}

export interface PhotosQuery {
  url: string
  fullUrl: string
  pathOnly: string
  params: PurpleParam[]
}

export interface PurpleParam {
  name: string
  value: string
}

export interface PickupInformation {
  available: boolean
}

export interface Place {
  id: number
  url: string
  sponsored: null
  name: string
  coordinate: Coordinate
  numberOfBusinesses: number
  numberOfRestaurants: number
  numberOfBeautyBusinesses: number
  numberOfHotels: number
  numberOfAttractions: number
  information: Information
}

export interface Coordinate {
  lat: number
  lng: number
}

export interface Information {
  nid: number | null
}

export interface PlaceInformation {
  floor: string
  zone: null | string
}

export interface PromotionStatistic {
  numberOfVisibleVouchers: number
  numberOfLinemanDeliveryPromotions: number
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
  params: SearchQueryParam[]
}

export interface SearchQueryParam {
  name: string
  value: string
  description: null | string
}

export interface RMS {
  ePayment: boolean
  acceptingOrder: boolean
  usingMenuStructure: boolean
}

export interface ServiceModel {
  kitchenOnly: boolean
  kitchenOnlyDelivery: boolean
  kitchenOnlyPickup: boolean
  message: null
}

export interface BusinessStatistic {
  numberOfBookmarks: number
  numberOfPhotos: number
  numberOfUserPhotos: number
  rating: number
  numberOfReviews: number
  showRating: boolean
  numberOfRatings: number
  numberOfVideos: number
}

export interface TopFavourite {
  name: string
}

export interface UsersChoice {
  year: number
  url: string
  labelUrl: string
  smallLabelImage: SmallLabelImage
  imageUrl: string
  imageUrl2: string
  name: string
  description: string
}

export interface Video {
  url: string
  streamUrl: string
  type: number
}

export interface WorkingHoursStatus {
  open: boolean
  message: string
  temporaryCloseStartDate: AddedTime | null
  temporaryCloseEndDate: AddedTime | null
  closingSoon: boolean
}

export interface Listing {
  id: number
  url: string
  title: string
  socialTitle: string
  picture: DefaultPhoto
  highlightPicture: DefaultPhoto
  by: By
  shortDescription: string
  description: string
  campaign: null
  addedTime: AddedTime
  lastUpdatedTime: AddedTime
  locationBased: boolean
  domain: Domain
  statistic: ListingStatistic
  tags: Tag[]
  content: null
  sponsoredMessage: SponsoredMessage
}

export interface By {
  id: string
  gid: string
  globalId: string
  isEditor: boolean
  url: string
  name: string
  me: boolean
  contentUrl: string
  profilePicture: ProfilePicture
  profilePictureLayers: any[]
  rank: Rank
  joinTime: AddedTime
  statistic: { [key: string]: number | null }
  isFollowing: boolean
  isBlocking: boolean
  mainPicture: MainPicture
  aboutMe: null | string
  thumbnailUrl: null
  photoUrl: null
  gender: City | null
  city: null | string
  userBadges: UserBadge[]
}

export interface MainPicture {
  thumbnailUrl: string
}

export interface ProfilePicture {
  url: string
  contentUrl: string
  thumbnailUrl: null
  uploaded: boolean
}

export interface Rank {
  name: string
  value: number
  url: string
  iconUrl: string
  fullIconUrl: string
}

export interface UserBadge {
  badgeDisplayName: string
  description: string
  badgeName: string
  message: string
  badgeImageUrl: string
  incompleteImageUrl: string
  complete: boolean
}

export interface SponsoredMessage {
  message: string
  pictures: any[]
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
}

export interface WongnaiQuery {
  url: string
  path: string
  fullPath: string
  params: SearchQueryParam[]
}

export interface ThemeCards {
  selected: null
  page: ThemeCardsPage
}

export interface ThemeCardsPage {
  pageInformation: PageInformation
  first: number
  last: number
  totalNumberOfPages: number
  totalNumberOfEntities: number
  entities: FluffyEntity[]
}

export interface FluffyEntity {
  id: number
  displayName: string
  socialTitle: string
  description: string
  url: string
  name: NameOnly
  coverPicture: DefaultPhoto
  following: boolean
  updatedTime: AddedTime | null
  featured: boolean
  watermark: null
  bannerMobile: null
  bannerTablet: null
  textColor: null | string
}
