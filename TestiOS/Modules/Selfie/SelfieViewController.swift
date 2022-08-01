//
//  SelfieViewController.swift
//  TestiOS
//
//  Created by javier apaez on 01/08/22.
//

import UIKit

class SelfieViewController: UIViewController {
    
    var selfieUIimage: UIImage?
    
    let selfieView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 22
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(selfieView)
        selfieView.image = selfieUIimage
        view.backgroundColor = .clear
        NSLayoutConstraint.activate([
            selfieView.topAnchor.constraint(equalTo: view.topAnchor, constant: 22),
            selfieView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 22),
            selfieView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -22),
            selfieView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -22),
        ])
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
