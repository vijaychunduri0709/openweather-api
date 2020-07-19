# openweather-api Documentation

Purpose of Openweather API is to provide temperature and timezone informaiton based on the city and country.API uses'POST' request to communicate and HTTP [response codes] to indicate status and errors in standard JSON format.All requests must include a content-type of application/json and the body must be valid JSON.


## Assumptions 

1) Request country information will be as per ISO 3166 as recommended by OpenWeather.
2) Key values in header will be in the same index of Items , for example if header list has city index as 3 , value in items will be in index 3.
3) Header values are static and as per "Mandatory key parameters" section, Index can be dynamic.

## Supported API functions
Currently the openweather-api supports one function which is weather.


### weather
```
HTTP Method: Post
basepath :: /api
path :: /weather
URL: http://localhost:8082/api/weather

####Headers:
X-Transaction-ID:1d066b50-2395-11e9-b87e-e2338e7f9809
client_id:f9d6b8c6da9b46418700ffba038b3ee0
client_secret:2B85673ba73e43bD8D06054d9a2A3385
```

#### Request Parameters

Header contains key's and Items contains corresponding values.
     
##### Required key parameters.
```
firstName
lastName
city
country (please use ISO 3166 country codes)
datetime
```

#### Example Request
**Request:**
```json
POST /login HTTP/1.1
Accept: application/json
Content-Type: application/json
{
    "Header": [
    "firstName", 
    "lastName", 
    "dateTime", 
    "city", 
    "country"
    ],
    
    "Items": [
    "Vijay", 
    "Chunduri", 
    "31012019T1900Z", 
    "Melbourne", 
    "Australia"
    ]
}

```


#### Example success response
**Success Response:**
```json
HTTP/1.1 200 OK
Content-Type: application/json
{
  "firstName": "Vijay",
  "lastName": "Chunduri",
  "fullName": "Vijay Chunduri",
  "dateTime": "2020-07-20 17:26:22.251",
  "temperatureCelcius": 10.53,
  "offset": "+1000",
  "city": "Melbourne",
  "location": "Australia/Melbourne",
  "timeZone": "Australian Eastern Standard Time"
}
```

#### Example error response
**Error Resposne:**
```json
HTTP/1.1 405 Method Not Allowed
Content-Type: application/json
{
  "message": "Method not allowed"
}
```

## Response Codes 
### Response Codes
```
200: Success
400: Bad Request-Parameter do not match the expected format/Payload Not as per Schema
401: Unauthorised Request
404: Resource not found
405: Method Not Allowed
415: Unsupported Media Type
422: Error Returned by API
500: Internal Server Error
```
## Build & Deployment process
### Environment details
```
Mule Runtime: 4.3
Anypoint Studio version: 7.5.1
Port: 8082
