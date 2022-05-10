//
//  MapView.swift
//  Safari
//
//  Created by Shubham Kumar on 24/01/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        return mapRegion
    }()
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: locations) { item in
            //            MapMarker(coordinate: item.location, tint: .accentColor)
            // Custom
            MapAnnotation(coordinate: item.location) {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 32)
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
