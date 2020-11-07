//
//  NewsLocation.swift
//  EcoNews
//
//  Created by Никита Ткаченко on 07.11.2020.
//

import Foundation
import MapKit
/// Потом создать еще один класс который будет хранить массив мусорок и инициализировать их из БД
class NewsLocation:NSObject, MKAnnotation{
    
    var coordinate: CLLocationCoordinate2D
    var name: String
    var title: String?
    
    init(coordinate: CLLocationCoordinate2D, name: String) {
        self.coordinate = coordinate
        self.name = name
        self.title = name
    }
}
