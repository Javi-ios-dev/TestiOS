//
//  HomeViewControllerTableViewDelegates.swift
//  TestiOS
//
//  Created by javier apaez on 30/07/22.
//

import Foundation
import UIKit

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: TextFieldTableViewCell.cellId, for: indexPath) as? TextFieldTableViewCell
            cell?.backgroundColor = .clear
            //            cell?.textField.delegate = self
            return cell!
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: SelfieTableViewCell.cellId, for: indexPath)
            var contentConfiguration = cell.defaultContentConfiguration()
            contentConfiguration.text = K.Strings.selfieCellTitle
            cell.contentConfiguration = contentConfiguration
            cell.backgroundColor = .clear
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: TextFieldTableViewCell.cellId, for: indexPath)
            var contentConfiguration = cell.defaultContentConfiguration()
            contentConfiguration.text = "Una gráfica o representación gráfica es un tipo de representación de datos, generalmente numéricos, mediante recursos visuales (líneas, vectores, superficies o símbolos), para que se manifieste visualmente la relación matemática o correlación estadística que guardan entre sí. También es el nombre de un conjunto de puntos que se plasman en coordenadas cartesianas y sirven para analizar el comportamiento de un proceso o un conjunto de elementos o signos que permiten la interpretación de un fenómeno. La representación gráfica permite establecer valores que no se han obtenido experimentalmente sino mediante la interpolación (lectura entre puntos) y la extrapolación (valores fuera del intervalo experimental)."
            cell.contentConfiguration = contentConfiguration
            cell.backgroundColor = .clear
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 1:
            showCamera()
        case 2:
            showCharts()
        default: break
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 58
        } else {
            return UITableView.automaticDimension
        }
        
    }
    
}

extension HomeViewController: HomeViewDelegate {
    func didSendButtonPress() {
        uploadSelfie()
    }
}

extension HomeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            return
        }
        self.selfieImage = image
    }
}

// 
extension HomeViewController {
    func showCamera() {
        
        let alertController = UIAlertController(title: "Selfie", message: "Cambia el nomre para visualizar tu selfie.", preferredStyle: .alert)
        
        let showSelfie = UIAlertAction(title: "Ver selfie", style: .default, handler: { (alert: UIAlertAction!) in
            
            // get name from textfield cell
            let cell = self.homeView.tableView.cellForRow(at: IndexPath(item: 0, section: 0)) as? TextFieldTableViewCell
            let name = cell?.textField.text!
            
            guard name! != "" else {
                let noselfiecontroller = UIAlertController(title: nil, message: "Introduce tu nombre", preferredStyle: .alert)
                noselfiecontroller.addAction(UIAlertAction(title: "Ok", style: .default))
                self.present(noselfiecontroller, animated: true)
                return
            }
            
            self.retriveSelfie(withName: name!)
        })
        
        
        let retakePicture = UIAlertAction(title: "Tomar selfie", style: .default, handler: {  (alert: UIAlertAction!) in
            self.retakeSelfie()
        })
        
        alertController.addAction(retakePicture)
        alertController.addAction(showSelfie)
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    func retakeSelfie() {
        let picker =   UIImagePickerController()
        
        if !UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .photoLibrary
        } else {
            picker.sourceType = .camera
        }
        picker.delegate = self
        present(picker, animated: true)
    }
    
    func uploadSelfie() {
        
        guard selfieImage != nil else {
            let noselfiecontroller = UIAlertController(title: nil, message: "Toma una foto primero", preferredStyle: .alert)
            noselfiecontroller.addAction(UIAlertAction(title: "Ok", style: .default))
            present(noselfiecontroller, animated: true)
            return
        }
        
        let cell = homeView.tableView.cellForRow(at: IndexPath(item: 0, section: 0)) as? TextFieldTableViewCell
        let name = cell?.textField.text!
        
        
        guard name! != "" else {
            let namecontroller = UIAlertController(title: nil, message: "Ingresa tu nombre", preferredStyle: .alert)
            namecontroller.addAction(UIAlertAction(title: "Ok", style: .default))
            present(namecontroller, animated: true)
            return
        }
        
        self.uploadSelfie(withUIImage: self.selfieImage!, andName: name!)
    }
}
