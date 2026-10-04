# Static reverse-engineering notes

Source: supplied `SekaliPay_1.0.15.apks`.

## Detected technology

Flutter AOT (`libapp.so`), AndroidX, Kotlin/Java plugins, Riverpod, GoRouter, Dio, Drift/SQLite, Secure Storage, Firebase, Google Sign-In, Local Auth, WebView, QR/ML Kit, Geolocator.

## Feature modules visible as Dart library names

`auth`, `balance`, `catalog`, `devices`, `disbursement`, `merchant`, `notifications`, `onboarding`, `order`, `points`, `profile`, `shell`, `tagihan`, `transfer`.

## Endpoint inventory observed in AOT string tables

```text
/auth/login
/auth/register
/auth/register/resend
/auth/register/verify
/auth/login/otp/resend
/auth/login/otp/verify
/auth/logout
/auth/me
/auth/refresh
/auth/google
/auth/forgot-password/request
/auth/forgot-password/reset
/auth/password/change
/auth/phone/complete
/auth/pin
/auth/pin/reset/otp
/auth/pin/reset/otp/verify
/auth/pin/reset/confirm
/auth/verify-pin
/auth/login/approval/pending
/auth/login/approval/status
/auth/login/approval/decide
/auth/login/approval/fallback-otp
/banners
/catalog
/catalog/version
/catalog/flash-sale
/catalog/flash-sale/jadwal
/catalog/operator-prefixes
/catalog/products/
/mobile/order
/order-status
/order/cancel
/order/voucher
/order/vouchers
/payment/status
/points/summary
/points/mutations
/points/redeem
/mobile/points/redeem
/transfer
/mobile/transfer
/transfer/lookup
/transfer/recent
/transfer/my-qr
/transfer/resolve-qr
/transfer/contacts/check
/notifications
/notifications/read-all
/devices
/devices/
/devices/web
/devices/web/
/settings/devices
/settings/notifications
/settings/profile
/profile/avatar
/profile/summary
/disbursement
/mobile/disbursement
/disbursement/config
/disbursement/inquiry
/disbursement/recent
/merchant
/merchant/status
/merchant/summary
/merchant/activity
/merchant/payments
/merchant/payments/:invoice
/merchant/announcements
/merchant/announcements/popup
/merchant/announcements/read-all
/merchant/balance-history
/merchant/withdraw
/merchant/withdraw/config
/merchant/withdrawals
/merchant/withdrawals/:id
```

The clone does not call the original service by default.
