//
//  Actor.swift
//  cjoTableViewer
//
//  Created by Thomas Morel on 4/28/19.
//  Copyright © 2019 OMJ. All rights reserved.
//

import UIKit

struct Actor: Decodable {
    let status: String
    let link: String
    let slug: String
    let type: String
 //   let title: [String]
   // let title: [Title]
    
    
    init(status: String, link: String, slug: String, type: String){
        self.status = status
        self.link = link
        self.slug = slug
        self.type = type
      // self.title = [title.description]
        
    }

}

struct Title: Decodable{
    
    let title: [String]
    
}

