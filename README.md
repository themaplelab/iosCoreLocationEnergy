# iOS Core Location Framework Energy

Exploiting the energy vulnerabilities of Core Location Framework from Apple. [link](https://developer.apple.com/documentation/corelocation/) 


Listings for recognizing each variant in code:

SignificantLocation API (Benchmarks [link](https://developer.apple.com/documentation/corelocation/) )
```
locationManager.startMonitoringSignificantLocationChanges()
```

Regional API (Benchmarks [link](https://github.com/themaplelab/iosCoreLocationEnergy/tree/master/LocationBenchmarks/RegionalAPI) )
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

StandardLocation API - Best (Benchmarks [link](https://github.com/themaplelab/iosCoreLocationEnergy/tree/master/LocationBenchmarks/StandardAPI_Best) )
```
locationManager.startUpdatingLocation()
locationManager.desiredAccuracy = kCLLocationAccuracyBest
locationManager.distanceFilter = 4096
```
StandardLocation API - Hundred Meters (Benchmarks [link](https://github.com/themaplelab/iosCoreLocationEnergy/tree/master/LocationBenchmarks/StandardAPI_HundredMeters) )
```
locationManager.startUpdatingLocation()
locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
locationManager.distanceFilter = 4096 
```
StandardLocation API - Kilometer (Benchmarks [link](https://github.com/themaplelab/iosCoreLocationEnergy/tree/master/LocationBenchmarks/StandardAPI_Kilometer) )
```
locationManager.startUpdatingLocation()
locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
locationManager.distanceFilter = 4096 
```
StandardLocation API - Navigation (Benchmarks [link](https://github.com/themaplelab/iosCoreLocationEnergy/tree/master/LocationBenchmarks/StandardAPI_Navigation) )
```
locationManager.startUpdatingLocation()
locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
locationManager.distanceFilter = 4096 
```
Visit Monitoring API - airborne (Benchmarks [link](https://github.com/themaplelab/iosCoreLocationEnergy/tree/master/LocationBenchmarks/VisitMonitoringAPI/VisitMoniotoringAPI_TypeAirborne) )
```
locationManager.startMonitoringVisits()
locationManager.activityType = CLActivityType.airborne
```
Visit Monitoring API - automotive (Benchmarks [link](https://github.com/themaplelab/iosCoreLocationEnergy/tree/master/LocationBenchmarks/VisitMonitoringAPI/VisitMoniotoringAPI_TypeAutomativeNavigation) )
```
locationManager.startMonitoringVisits()
locationManager.activityType = CLActivityType.automotiveNavigation
```
Visit Monitoring API - other (Benchmarks [link](https://github.com/themaplelab/iosCoreLocationEnergy/tree/master/LocationBenchmarks/VisitMonitoringAPI/VisitMoniotoringAPI_TypeOther) )
```
locationManager.startMonitoringVisits()
locationManager.activityType = CLActivityType.other
```
Visit Monitoring API - otherNavigation (Benchmarks [link](https://github.com/themaplelab/iosCoreLocationEnergy/tree/master/LocationBenchmarks/VisitMonitoringAPI/VisitMoniotoringAPI_TypeOtherNavigation) )
```
locationManager.startMonitoringVisits()
locationManager.activityType = CLActivityType.otherNavigation
```
Visit Monitoring API - fitness (Benchmarks [link](https://github.com/themaplelab/iosCoreLocationEnergy/tree/master/LocationBenchmarks/VisitMonitoringAPI/VisitMoniotoringAPI_TypeFitness) )
```
locationManager.startMonitoringVisits()
locationManager.activityType = CLActivityType.fitness
```
Visit Monitoring API - default (Benchmarks [link](https://github.com/themaplelab/iosCoreLocationEnergy/tree/master/LocationBenchmarks/VisitMonitoringAPI/VisitMoniotoringAPI_TypeDefault) )
```
locationManager.startMonitoringVisits()
```
