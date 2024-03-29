//
//  DemoURLs.swift
//  Cassini
//
//  Created by Vishal Kashyap on 14/08/23.
//

import Foundation


struct DemoURLs {
    
    // Stanford's Oval image
//    static let stanford = Bundle.main.url(forResource: "oval", withExtension: "jpg")
        static let stanford = URL(string: "https://upload.wikimedia.org/wikipedia/commons/5/55/Stanford_Oval_September_2013_panorama.jpg")
    
    static var NASA: Dictionary<String,URL> = {
        let NASAURLStrings = [
            // (This Tesla image takes less time to download)
            "Cassini" : "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b2/Cassini_Saturn_Orbit_Insertion.jpg/1920px-Cassini_Saturn_Orbit_Insertion.jpg",
            // "Cassini" : "https://www.jpl.nasa.gov/images/cassini/20090202/pia03883-full.jpg",
            "Earth" : "https://www.nasa.gov/sites/default/files/wave_earth_mosaic_3.jpg",
            "Saturn" : "https://www.nasa.gov/sites/default/files/saturn_collage.jpg"
        ]
        var urls = Dictionary<String,URL>()
        for (key, value) in NASAURLStrings {
            urls[key] = URL(string: value)
        }
        return urls
    }()
}
