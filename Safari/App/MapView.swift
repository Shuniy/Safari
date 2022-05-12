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
                MapAnnotationView(location: item)
            }
        }//:Map
        .overlay(alignment: .top) {
            HStack {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 48, alignment: .center)
                VStack(alignment: .leading, spacing: 3) {
                    HStack {
                        Text("Latitude")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                    Divider()
                    HStack {
                        Text("Longitude")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                }
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(Color.black
                .cornerRadius(9)
                .opacity(0.6))
            .padding()
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
