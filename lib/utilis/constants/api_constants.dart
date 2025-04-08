class APIConstants {
  // Base URLs
  static const String baseUrl = "https://api.yourdomain.com/v1";
  static const String stagingBaseUrl = "https://staging-api.yourdomain.com/v1";

  // Authentication Endpoints
  static const String loginEndpoint = "/auth/login";
  static const String registerEndpoint = "/auth/register";
  static const String refreshTokenEndpoint = "/auth/refresh";
  static const String logoutEndpoint = "/auth/logout";

  // User Endpoints
  static const String userProfileEndpoint = "/users/me";
  static const String updateProfileEndpoint = "/users/update";
  static const String changePasswordEndpoint = "/users/change-password";

  // Product Endpoints
  static const String productsEndpoint = "/products";
  static const String featuredProductsEndpoint = "/products/featured";
  static const String searchProductsEndpoint = "/products/search";
  static const String productCategoriesEndpoint = "/products/categories";

  // Order Endpoints
  static const String createOrderEndpoint = "/orders/create";
  static const String orderHistoryEndpoint = "/orders/history";
  static const String orderDetailsEndpoint = "/orders/details";

  // Payment Endpoints
  static const String paymentInitiateEndpoint = "/payments/initiate";
  static const String paymentVerifyEndpoint = "/payments/verify";

  // API Headers
  static const String contentTypeHeader = "Content-Type";
  static const String acceptHeader = "Accept";
  static const String authorizationHeader = "Authorization";
  static const String applicationJson = "application/json";

  // API Keys (Note: In production, these should be secured through environment variables)
  static const String tSecretAPIKey = "cwt_live_b2da6ds3df3e785v8ddc59198f7615ba";
  static const String tMapAPIKey = "map_live_3kf9ds83kf02kf92kf";

  // Timeouts
  static const int connectTimeout = 30000; // 30 seconds
  static const int receiveTimeout = 30000; // 30 seconds

  // Status Codes
  static const int successStatusCode = 200;
  static const int createdStatusCode = 201;
  static const int unauthorizedStatusCode = 401;
  static const int notFoundStatusCode = 404;

  // Pagination
  static const String defaultPageSize = "10";
  static const String maxPageSize = "100";

  // File Upload
  static const String fileUploadSizeLimit = "5242880"; // 5MB
  static const List<String> allowedFileTypes = ["image/jpeg", "image/png", "image/gif"];
}