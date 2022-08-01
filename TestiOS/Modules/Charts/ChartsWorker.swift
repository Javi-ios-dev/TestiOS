//
//  ChartsWorker.swift
//  TestiOS
//
//  Created by javier apaez on 30/07/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import FirebaseDatabase

class ChartsWorker {
    
    var ref: DatabaseReference!
    
    init() {
        ref = Database.database().reference()
    }
    
    func fetchChartsData(completionHandler: @escaping(Graficas) -> Void) {
        
        NetworkManager.shared.getCharts { result in
            switch result {
            case .success(let graficas):
                completionHandler(graficas)
            case .failure(_):
                print("error")
            }
        }
    }
    
    func colorWorker(completionHanlder: @escaping(String)->Void) {
        ref.child("appsettings").observe(.value) { snapshot in
            let value = snapshot.value as? NSDictionary
            completionHanlder(value!["backgroundColor"] as! String)
        }
    }
}
