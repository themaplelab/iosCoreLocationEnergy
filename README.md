# iOS Core Location Framework Energy

Exploiting the energy vulnerabilities of Core Location Framework from Apple. [link](https://developer.apple.com/documentation/corelocation/) 


Listings for recognizing each variant in code:

SignificantLocation API
```
locationManager.startMonitoringSignificantLocationChanges()
```

Regional API
```
if CLLocationManager.isMonitoringAvailable(for: CLCircularRegion.self) {
// Register the region.
let maxDistance = locationManager.maximumRegionMonitoringDistance
let region = CLCircularRegion(center: center, 
radius: maxDistance, identifier: identifier)
region.notifyOnEntry = true
region.notifyOnExit = false
locationManager.startMonitoring(for: region)
```

StandardLocation API - Best
```
locationManager.startUpdatingLocation()
locationManager.desiredAccuracy = kCLLocationAccuracyBest
locationManager.distanceFilter = 4096
```
StandardLocation API - Hundred Meters
```
locationManager.startUpdatingLocation()
locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
locationManager.distanceFilter = 4096 
```
StandardLocation API - Kilometer
```
locationManager.startUpdatingLocation()
locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
locationManager.distanceFilter = 4096 
```
StandardLocation API - Navigation
```
locationManager.startUpdatingLocation()
locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
locationManager.distanceFilter = 4096 
```
Visit Monitoring API - airborne
```
locationManager.startMonitoringVisits()
locationManager.delegate = self
locationManager.activityType = CLActivityType.airborne
```
Visit Monitoring API - automotive
```
locationManager.startMonitoringVisits()
locationManager.delegate = self
locationManager.activityType = CLActivityType.automotiveNavigation
```
Visit Monitoring API - other
```
locationManager.startMonitoringVisits()
locationManager.delegate = self
locationManager.activityType = CLActivityType.other
```
Visit Monitoring API - otherNavigation
```
locationManager.startMonitoringVisits()
locationManager.delegate = self
locationManager.activityType = CLActivityType.otherNavigation
```
Visit Monitoring API - fitness
```
locationManager.startMonitoringVisits()
locationManager.delegate = self
locationManager.activityType = CLActivityType.fitness
```
