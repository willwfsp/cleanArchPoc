//
//  HomeModels.swift
//  Presentation
//
//  Created by Willian Fagner Souza Polici on 07/05/18.
//  Copyright © 2018 Willian Fagner Souza Polici. All rights reserved.
//

import Foundation
import Utils
import Domain

struct Home {
    struct GetBalance {
        struct Request {
            
        }
        
        struct Response {
            let result: Result<Balance>
        }
        
        struct ViewModel {
            
        }
    }
}
