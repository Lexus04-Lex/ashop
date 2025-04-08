// Text Sizes for UI customization
enum TextSizes { small, medium, large, xLarge }

// Product Sizes (common clothing sizes)
enum ProductSize { xs, s, m, l, xl, xxl }

// Product variants
enum ProductType { single, variable }

// Order status lifecycle
enum OrderStatus {
  processing,
  confirmed,
  shipped,
  outForDelivery,
  delivered,
  cancelled,
  returned,
  refunded
}

// Payment methods supported by the app
enum PaymentMethods {
  paypal,
  googlePay,
  applePay,
  visa,
  masterCard,
  creditCard,
  paystack,
  razorPay,
  paytm,
  bankTransfer,
  cashOnDelivery,
  wallet
}

// Product sorting options
enum ProductSorting {
  newest,
  priceLowToHigh,
  priceHighToLow,
  topRated,
  mostPopular,
  featured
}

// Delivery options
enum DeliveryOptions {
  standard,
  express,
  sameDay,
  storePickup
}

// Notification types
enum NotificationType {
  orderUpdate,
  paymentSuccess,
  deliveryUpdate,
  promotion,
  system
}

// User roles
enum UserRole {
  customer,
  seller,
  admin,
  moderator
}

// Product condition
enum ProductCondition {
  newProduct,
  refurbished,
  usedLikeNew,
  usedGood,
  usedFair
}

// Filter options
enum FilterType {
  category,
  priceRange,
  rating,
  brand,
  availability
}