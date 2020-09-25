/// Copyright (c) 2018 Razeware LLC
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import UIKit
import CoreLocation
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  
  static let geoCoder = CLGeocoder()
  let center = UNUserNotificationCenter.current()
  let locationManager = CLLocationManager()
  
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    let rayWenderlichColor = UIColor(red: 0/255, green: 104/255, blue: 55/255, alpha: 1)
    UITabBar.appearance().tintColor = rayWenderlichColor
    
    center.requestAuthorization(options: [.alert, .sound]) { granted, error in
    }
    LocationsStorage.shared.deleteLocationOnDisk()
    locationManager.delegate = self
    locationManager.requestAlwaysAuthorization()
    
    return true
  }
}
   
extension AppDelegate: CLLocationManagerDelegate {
  
  func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
    print("Did Arrive: \(region.identifier)")
    self.newVisitReceived(description: "Did Enter: \(region.identifier) region.")
  }
  
  func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
    print("Did Leave: \(region.identifier)")
    self.newVisitReceived(description: "Did Exit: \(region.identifier) region.")
  }
    
  func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
      print("Authorized status changed")
      if CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedAlways || CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedWhenInUse {
          
          // Walmart = 53.597698, -113.487649
          let circularRegion1 = CLCircularRegion.init(center: CLLocationCoordinate2D.init(latitude: CLLocationDegrees.init(53.597698), longitude: CLLocationDegrees.init(-113.487649)),
                                                     radius: 100.0,
                                                     identifier: "Walmart")
          // Safeway = 53.598311, -113.490681
          let circularRegion2 = CLCircularRegion.init(center: CLLocationCoordinate2D.init(latitude: CLLocationDegrees.init(53.598311), longitude: CLLocationDegrees.init(-113.490681)),
                                                      radius: 50.0,
          identifier: "Safeway")
          
          // Masjid Quba = 53.570647, -113.496046
          let circularRegion3 = CLCircularRegion.init(center: CLLocationCoordinate2D.init(latitude: CLLocationDegrees.init(53.570647), longitude: CLLocationDegrees.init(-113.496046)),
                                                      radius: 50.0,
          identifier: "Masjid")
          
          // NAIT = 53.569614, -113.502237
          let circularRegion4 = CLCircularRegion.init(center: CLLocationCoordinate2D.init(latitude: CLLocationDegrees.init(53.569614), longitude: CLLocationDegrees.init(-113.502237)),
          radius: 200.0,
          identifier: "NAIT")
          
          // HudsonBay = 53.560654, -113.505042
          let circularRegion5 = CLCircularRegion.init(center: CLLocationCoordinate2D.init(latitude: CLLocationDegrees.init(53.560654), longitude: CLLocationDegrees.init(-113.505042)),
          radius: 50.0,
          identifier: "HudsonBay")
          
        // Fossil = 53.562612, -113.506196
          let circularRegion6 = CLCircularRegion.init(center: CLLocationCoordinate2D.init(latitude: CLLocationDegrees.init(53.562612), longitude: CLLocationDegrees.init(-113.506196)),
                                                      radius: 10.0,
          identifier: "Fossil")
        
        
          circularRegion1.notifyOnEntry = true
          circularRegion1.notifyOnExit = true
          locationManager.startMonitoring(for: circularRegion1)
        
          circularRegion2.notifyOnEntry = true
          circularRegion2.notifyOnExit = true
          locationManager.startMonitoring(for: circularRegion2)
        
          circularRegion3.notifyOnEntry = true
          circularRegion3.notifyOnExit = true
          locationManager.startMonitoring(for: circularRegion3)
        
          circularRegion4.notifyOnEntry = true
          circularRegion4.notifyOnExit = true
          locationManager.startMonitoring(for: circularRegion4)
        
          circularRegion5.notifyOnEntry = true
          circularRegion5.notifyOnExit = true
          locationManager.startMonitoring(for: circularRegion5)
        
          circularRegion6.notifyOnEntry = true
          circularRegion6.notifyOnExit = true
          locationManager.startMonitoring(for: circularRegion6)
        
      }
  }
  
  func newVisitReceived(description: String) {
    
    LocationsStorage.shared.saveLocationOnDisk(description)
    
    let content = UNMutableNotificationContent()
    content.title = "New entry 📌"
    content.sound = UNNotificationSound.default
    
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
    let request = UNNotificationRequest(identifier: "any", content: content, trigger: trigger)
    
    center.add(request, withCompletionHandler: nil)
  }
  
  
}

final class FakeVisit: CLVisit {
  private let myCoordinates: CLLocationCoordinate2D
  private let myArrivalDate: Date
  private let myDepartureDate: Date

  override var coordinate: CLLocationCoordinate2D {
    return myCoordinates
  }
  
  override var arrivalDate: Date {
    return myArrivalDate
  }
  
  override var departureDate: Date {
    return myDepartureDate
  }
  
  init(coordinates: CLLocationCoordinate2D, arrivalDate: Date, departureDate: Date) {
    myCoordinates = coordinates
    myArrivalDate = arrivalDate
    myDepartureDate = departureDate
    super.init()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
