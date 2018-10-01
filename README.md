<!-- README.md is generated from README.Rmd. Please edit that file -->
IMmailgun
=========

The goal of IMmailgun is to make sending emails from R easy. To use it, you will need a [mailgun](https://www.mailgun.com) account.

Example
-------

This is a basic example which shows you how to solve a common problem:

``` r
library(IMmailgun)
email_client <- mailgun$new(url = url, api_key = api_key, from = from)

email_client$sendEmail(to = c("ignacio82@gmail.com", "ignacio@protonmail.com"), 
                       subject = "Test", plaintext = "Hola a todos!")
#> [[1]]
#> Response [https://api.mailgun.net/v3/email.ignacio.website/messages]
#>   Date: 2017-11-18 13:59
#>   Status: 200
#>   Content-Type: application/json
#>   Size: 109 B
#> {
#>   "id": "<20171118135928.5521.00B9D6D04BDF91A9@email.ignacio.website>",
#>   "message": "Queued. Thank you."
#> 
#> [[2]]
#> Response [https://api.mailgun.net/v3/email.ignacio.website/messages]
#>   Date: 2017-11-18 13:59
#>   Status: 200
#>   Content-Type: application/json
#>   Size: 110 B
#> {
#>   "id": "<20171118135929.35553.18C6B386247556F5@email.ignacio.website>",
#>   "message": "Queued. Thank you."
```

### Add attachemt

``` r

email_client$sendEmail(to = "ignacio82@gmail.com", 
                       subject = "Test with attachment", 
                       plaintext = "Check the attachment",
                       attachment = './README.md')
#> [[1]]
#> Response [https://api.mailgun.net/v3/email.ignacio.website/messages]
#>   Date: 2017-11-18 13:59
#>   Status: 200
#>   Content-Type: application/json
#>   Size: 109 B
#> {
#>   "id": "<20171118135929.6327.029AF950E7C2B85C@email.ignacio.website>",
#>   "message": "Queued. Thank you."
```

### Get stats

``` r
email_client$stats()
#>                 id  event total_count created_at
#> 1 512b93ba0c7f0ab9 opened           1 2017-11-18
#> 2 5cc697702a96e913 opened           1 2017-11-16
#> 3 39f91001065c7cca opened           6 2017-11-15
#> 4 ede64ad2596dc9a5 opened           3 2017-11-14
```
