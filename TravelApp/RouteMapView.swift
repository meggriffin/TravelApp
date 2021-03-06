//
//  RouteMapView.swift
//  TravelApp
//
//  Created by Eli on 06.12.14.
//  Copyright (c) 2014 Eli. All rights reserved.
//

import UIKit

class RouteMapView : UIViewController{
    
    var passedData : [Marker]!

    override func viewDidLoad() {
        
        super.viewDidLoad()
        var camera = GMSCameraPosition.cameraWithLatitude(passedData[0].getLatitude(), longitude:passedData[0].getLongitude(), zoom:1)
        var mapView = GMSMapView.mapWithFrame(CGRectZero, camera:camera)
        mapView.mapType = kGMSTypeTerrain
        var path = GMSMutablePath()

        for marker in passedData{
            //AddPath
            path.addLatitude(marker.getLatitude(), longitude: marker.getLongitude())
            //PlacePins
            var pin = GMSMarker()
            pin.position = CLLocationCoordinate2DMake(marker.getLatitude(), marker.getLongitude())
            pin.snippet = marker.getName()
            pin.appearAnimation = kGMSMarkerAnimationPop
            pin.map = mapView
        }
        var polyline = GMSPolyline(path:path)
        polyline.strokeColor = UIColor.yellowColor()
        polyline.strokeWidth = 5.0
        polyline.map = mapView
        self.view = mapView
    }
    
}