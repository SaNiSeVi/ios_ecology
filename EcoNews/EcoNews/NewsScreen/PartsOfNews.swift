//
//  PartsOfNews.swift
//  EcoNews
//
//  Created by Никита Ткаченко on 30.12.2020.
//

import Foundation
import UIKit

struct PartsOfNews {
    var title: String
    var news: [News]
    
}


struct News {
    var photo: UIImage?
    var title: String
    var info: String
}


extension PartsOfNews{
    static var allNews: [PartsOfNews]{
        
        return [
            PartsOfNews(title: "Россия", news: [
                            News(photo: nil,
                                 title: "Москва",
                                 info: "Открытие нового ТЦ"),
                            News(photo: nil,
                                 title: "Санкт-Петербург",
                                 info: "Открытие фонтана на набережной")]),
            
            PartsOfNews(title: "Испания", news: [
                            News(photo: nil,
                                 title: "Мадрид",
                                 info: "Открытие нового ТЦ"),
                            News(photo: nil,
                                 title: "Барселона",
                                 info: "Открытие фонтана на набережной")])
        ]
    }
}
