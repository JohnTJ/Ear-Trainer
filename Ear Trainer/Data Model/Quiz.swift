//
//  Quiz.swift
//  Ear Trainer
//
//  Created by John Jones on 8/12/19.
//  Copyright © 2019 John Jones. All rights reserved.
//

import Foundation

class Quiz {
    var title: String
    var description: String
    var media: [[Sound]]
    
    init(title: String, description: String, media: [[Sound]]) {
        self.title = title
        self.description = description
        self.media = media
    }
}
