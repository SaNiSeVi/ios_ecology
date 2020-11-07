//
//  MapViewController.swift
//  EcoNews
//
//  Created by Никита Ткаченко on 07.11.2020.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    
    let firstNews = NewsLocation(coordinate: CLLocationCoordinate2D(latitude: 55.7564540 , longitude: 37.6182540), name: "Моя первая новость")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mapView.delegate = self
        
        
        // Отображаем нашу созданную новость
        mapView.addAnnotation(firstNews)
        

    }
    // Когда уже все отобразилось
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkLocationEnabled()
    }
    
    
    
    /// Проверяет включена ли геолокация
    func checkLocationEnabled()
    {
        if CLLocationManager.locationServicesEnabled(){
            setUpManager()
            checkAuthorization()
        }else{
            showAlertLocation(title: "У вас выключена геолокация", message: "Хотите включить?", url: URL(string: "App-Prefs:root=LOCATION_SERVICES"))
            
        }
    }
    
    func setUpManager()
    {
        locationManager.delegate = self
        // Точность определения местоположения
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    
    func checkAuthorization()
    {
        switch CLLocationManager.authorizationStatus(){
        // Разрешено всегда использовать местоположение
        case .authorizedAlways:
            break
            // Разрешено при использовании приложения
        case .authorizedWhenInUse:
            mapView.showsUserLocation = true
            locationManager.startUpdatingLocation()
            break
            // Запрещено использование
        case .denied:
            showAlertLocation(title: "Вы запретили использование местоположения", message: "Хотите это изменить?", url: URL(string: UIApplication.openSettingsURLString))
            break
            // Ограничено на устройстве
        case .restricted:
            break
            // Не запрошено
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        @unknown default:
            break
        }
    }
    
    /// Показывает диалоговое сообщение пользователю
    /// - Parameters:
    ///   - title:
    ///   - message:
    ///   - url:
    func showAlertLocation(title:String, message:String?, url:URL?)
    {
        let alert = UIAlertController(title:title, message: message, preferredStyle: .alert)
        let settingsAction = UIAlertAction(title: "Настройки", style: .default){ (alert) in
            if let url = url{
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        
        alert.addAction(settingsAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    
    
    
}
extension MapViewController:CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last?.coordinate{
            // Показ определенного места в заданном радиусе пользователю
            let region = MKCoordinateRegion(center: location, latitudinalMeters: 5000, longitudinalMeters: 5000)
            mapView.setRegion(region, animated: true)
        }
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkAuthorization()
    }
}


extension MapViewController:MKMapViewDelegate{
    // Меняем вьюшку для наших маркеров
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? NewsLocation else { return nil }
        var viewMarker:MKMarkerAnnotationView
        let idView = "marker"
        if let view = mapView.dequeueReusableAnnotationView(withIdentifier: idView) as? MKMarkerAnnotationView{
            view.annotation = annotation
            viewMarker = view
        }else{
            viewMarker = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: idView)
            // Показ окна
            viewMarker.canShowCallout = true
            // Смещение
            viewMarker.calloutOffset = CGPoint(x: 0, y: 6)
            // Кнопка
            viewMarker.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        // Возвращаем измененный маркер
        return viewMarker
    }
    // То что происходит при нажатии на кнопку во вьюшке маркера (строим маршрут)
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let coordinate = locationManager.location?.coordinate else {return}
        // Удаляем раннее построенные маршруты
        self.mapView.removeOverlays(mapView.overlays)
        
        let trashcan = view.annotation as! NewsLocation
        // Начальная точка пути то есть наша геопозиция
        let startPoint = MKPlacemark(coordinate: coordinate)
        // Конечная точка пути то есть геопозиция выбраннйо мусорки
        let endPoint = MKPlacemark(coordinate: trashcan.coordinate)
        
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: startPoint)
        request.destination = MKMapItem(placemark: endPoint)
        request.transportType = .walking
        
        let direction = MKDirections(request: request)
        direction.calculate { (response, error) in
            // наш маршрут
            guard let response = response else { return }
            for route in response.routes{
                // Строим маршрут на карте по ломанной линии
                self.mapView.addOverlay(route.polyline)
            }
        }
    }
    // Стиль саммх ломанных на маршруте
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let render = MKPolylineRenderer(overlay: overlay)
        render.strokeColor = .blue
        render.lineWidth = 4
        return render
    }
    
    
}

    
   
