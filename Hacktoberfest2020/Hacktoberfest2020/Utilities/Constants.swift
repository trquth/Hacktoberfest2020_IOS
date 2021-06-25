//
//  Constants.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 24/06/2021.
//

import Foundation

let apiKey = "19699ae27e95723a000aae4c490c1686"

func flickrURL(forApiKey key: String, withAnnotation annotation: DroppablePin, andNumberOfPhotos number: Int) -> String {
    let url = "https://www.flickr.com/services/rest/?method=flickr.photos.search&api_key=\(key)&lat=\(annotation.coordinate.latitude)&lon=\(annotation.coordinate.longitude)&radius=1&radius_units=mi&per_page=\(number)&format=json&nojsoncallback=1"
    print(url)
    return url
    
}

