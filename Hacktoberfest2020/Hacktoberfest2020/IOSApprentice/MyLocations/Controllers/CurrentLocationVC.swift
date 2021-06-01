//
//  FirstScreenVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 14/12/2020.
//

import UIKit
import CoreLocation

class CurrentLocationVC: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    var location : CLLocation?
    var updatingLocation = false
    var lastLocationError : Error?
    
    let latitudeLbl : UILabel = {
        return createLbl(title : "Latitude: ")
    }()
    
    let latitudeValueLbl : UILabel = {
        return createValueLbl(value : "0")
    }()
    
    let longitubeLbl : UILabel = {
        return createLbl(title : "Longitube: ")
    }()
    
    let longitudeValueLbl : UILabel = {
        return createValueLbl(value : "0")
    }()
    
    let messageLbl : UILabel = {
        return createLbl(title : "Message")
    }()
    
    let addressLbl : UILabel = {
        return createLbl(title : "Address")
    }()
    
    let tagBtn : UIButton = {
        let btn = createButton(title: "Tag Location")
        btn.addTarget(self, action: #selector(goToTagLocationScreen), for: .touchUpInside)
        return btn
    }()
    
    let getLocationBtn : UIButton = {
        let btn = createButton(title: "Get My Location")
        btn.addTarget(self, action: #selector(getLocation), for: .touchUpInside)
        return btn
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateLabels(nil)
        configureView()
    }
    
   
    
    //MARK: Function
    func configureView() {
        self.navigationController?.isNavigationBarHidden = true
        
        let latitudeStack = UIStackView(arrangedSubviews: [latitudeLbl, latitudeValueLbl])
        latitudeStack.distribution = .equalSpacing
        //        latitudeStack.translatesAutoresizingMaskIntoConstraints = false
        //        view.addSubview(latitudeStack)
        
        let longitudeStack = UIStackView(arrangedSubviews: [longitubeLbl, longitudeValueLbl])
        longitudeStack.distribution = .equalSpacing
        //        longitudeStack.translatesAutoresizingMaskIntoConstraints = false
        //        view.addSubview(longitudeStack)
        
        let locationStack = UIStackView(arrangedSubviews: [latitudeStack, longitudeStack])
        locationStack.axis = .vertical
        locationStack.distribution = .equalSpacing
        locationStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(locationStack)
        
        view.addSubview(messageLbl)
        view.addSubview(addressLbl)
        view.addSubview(tagBtn)
        view.addSubview(getLocationBtn)
        
        
        
        //        NSLayoutConstraint.activate([
        //            latitudeStack.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
        //            latitudeStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
        //            latitudeStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
        //            latitudeStack.heightAnchor.constraint(equalToConstant: 50)
        //        ])
        //
        //        NSLayoutConstraint.activate([
        //            longitudeStack.topAnchor.constraint(equalTo: latitudeStack.bottomAnchor, constant: 5),
        //            longitudeStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
        //            longitudeStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
        //            longitudeStack.heightAnchor.constraint(equalToConstant: 50)
        //        ])
        
        NSLayoutConstraint.activate([
            messageLbl.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50),
            //            messageLbl.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            //            messageLbl.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            messageLbl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            locationStack.topAnchor.constraint(equalTo: messageLbl.bottomAnchor, constant: 50),
            locationStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            locationStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            locationStack.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            addressLbl.topAnchor.constraint(equalTo: locationStack.bottomAnchor, constant: 20),
            addressLbl.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            addressLbl.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
        ])
        
        NSLayoutConstraint.activate([
            tagBtn.topAnchor.constraint(equalTo: self.addressLbl.bottomAnchor, constant: 40),
            tagBtn.heightAnchor.constraint(equalToConstant: 35),
            tagBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            getLocationBtn.topAnchor.constraint(equalTo: self.tagBtn.bottomAnchor, constant: 40),
            getLocationBtn.heightAnchor.constraint(equalToConstant: 35),
            getLocationBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        
        
    }
    
    static func createLbl(title: String) -> UILabel {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        let attributes = NSAttributedString(string: title, attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        lbl.attributedText = attributes
        return lbl
    }
    
    static func createValueLbl(value: String) -> UILabel {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        let attributes = NSAttributedString(string: value, attributes: [NSAttributedString.Key.foregroundColor : UIColor.black])
        lbl.attributedText = attributes
        return lbl
    }
    
    static func createButton(title: String) -> UIButton {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(title, for: .normal)
        return button
    }
    
    @objc func getLocation(){
        let authStatus = CLLocationManager.authorizationStatus()
        if authStatus == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
            return
        }
        
        if authStatus == .denied || authStatus == .restricted {
            showLocationServicesDeniedMethod()
            return
        }
//        locationManager.delegate = self
//        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
//        locationManager.startUpdatingLocation()
        starLocationManager()
        updateLabels(location)
    }
    
    //MARK: - CLLocationManagerDelegate
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("didFailWithError \(error.localizedDescription)")
        
        if (error as NSError).code == CLError.locationUnknown.rawValue {
            return
        }
        
        lastLocationError = error
        updateLabels(nil)
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let newLocation = locations.last
        print("didUpdateLocations \(newLocation)")
        
        location = newLocation
        updateLabels(newLocation)
    }
    
    //MARK: - Helper Methods
    func showLocationServicesDeniedMethod()  {
        let alert = UIAlertController(title: "Location Services Disabled", message: "Please enable location services for this app in Settings.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func updateLabels(_ location: CLLocation?)  {
        if let location = location {
            latitudeValueLbl.text = String(format: "%.8f", location.coordinate.latitude)
            longitudeValueLbl.text = String(format: "%.8f", location.coordinate.longitude)
            tagBtn.isHidden = false
            messageLbl.text = ""
        }else{
            latitudeValueLbl.text = ""
            longitudeValueLbl.text = ""
            addressLbl.text = ""
            tagBtn.isHidden = true
            messageLbl.text = "Tap ’Get My Location’ to Start"
            // Remove the following line messageLabel.text = "Tap ’Get My Location’ to Start" // The new code starts here:
            
            let statusMessage: String
            if let error = lastLocationError as NSError? {
                if error.domain == kCLErrorDomain && error.code == CLError.denied.rawValue {
                    statusMessage = "Location Services Disabled"
                } else {
                    statusMessage = "Error Getting Location"
                }
            } else if !CLLocationManager.locationServicesEnabled() {
                statusMessage = "Location Services Disabled"
            } else if updatingLocation {
                statusMessage = "Searching..."
            } else {
                statusMessage = "Tap ’Get My Location’ to Start"
            }
            messageLbl.text = statusMessage
        }
    }
    
    func stopLocationManager() {
        if updatingLocation {
            locationManager.stopUpdatingLocation()
            locationManager.delegate = nil
            updatingLocation = false
        }else{
            
        }
    }
    
    func starLocationManager() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
            updatingLocation = true
        }
    }
    
   @objc func goToTagLocationScreen() {
        navigationController?.pushViewController(LocationDetailVC(), animated: true)
    }
}
