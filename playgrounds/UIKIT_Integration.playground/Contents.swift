import UIKit
import SwiftUI
import MapKit

extension Airport : MKAnnotation {
    public var coordinate : CLLocationCoordate2D {
        return CLLocationCoordate2D(latitude: latittude, longitude: longitude)
    }
    public var title: String? { name ?? icao }
    public var subtitle: String? { location }

}

struct MapView : UIViewRepresentable {

    let annotations: [MKAnnotation]
    @Binding var selection: MKAnnotation?

    func makeUIView(context : Context) -> MKMapView {
        let mkMapView = MKMapView()
        mkMapView.delegate = context.coordinator
        return mkMapView
    }
    func updateUIView(_ uiView: MKMapView, context : Context) {
        if let annotation = selection {
            let town = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1 )
            uiView.setRegion(MKCoordinateRegion(center: annotation.coordiante, span: town), animated: true)
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
    class Coordinator: NSObject, MKMapViewDelegate {
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            let view = mapView.dequeueReusableAnnotationViw(withIdentifer: "MapViewAnnotation") ?? MKPinAnnotation(annotation:annotation, resuableIdentifer: "MapViewAnnotation")
            view.canShowCallout = true
            return view
        }
    }
}
