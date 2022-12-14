//
//  RootViewController.swift
//  youtellwecare_YTWC
//
//  Created by noshair on 15/01/2020.
//  Copyright © 2020 ucp. All rights reserved.
//

import UIKit
import TinyConstraints
import FirebaseStorage
import FirebaseFirestore
import Kingfisher
import AVKit
import Vision

struct MyKeys {
    static let imagesFolder = "imagesFolder"
    static let imagesCollection = "imagesCollection"
    static let uid = "uid"
    static let imageUrl = "imageUrl"
}

class RootViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
    
    
    
  //  @IBOutlet weak var ML: UIButton!
    
    
    lazy var takePhotoBarButtonItem = UIBarButtonItem(title: "Take", style: .done, target: self, action: #selector(takePhoto))
    
    lazy var savePhotoBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(savePhoto))
    
     lazy var picBarButtonItem = UIBarButtonItem(title: "pic", style: .plain, target: self, action: #selector(pic))
    
    lazy var uploadPhotoBarButtonItem = UIBarButtonItem(title: "Upload", style: .done, target: self, action: #selector(uploadPhoto))
    
    lazy var downloadPhotoBarButtonItem = UIBarButtonItem(title: "Download", style: .plain, target: self, action: #selector(downloadPhoto))
    
    lazy var imagePickerController: UIImagePickerController = {
        let controller = UIImagePickerController()
        controller.delegate = self
        controller.sourceType = .camera
        return controller
    }()
    
   lazy var imageView: UIImageView = {
       let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.backgroundColor = .lightGray
        return iv
    }()
    
    let activityIndicator = UIActivityIndicatorView(style: .gray)
    
    
    let identifierLabel: UILabel = {
          let label = UILabel()
          label.backgroundColor = .white
          label.textAlignment = .center
          label.translatesAutoresizingMaskIntoConstraints = false
          return label
      }()
    
    
    
    let model = youtellwecare_YTWC_ML_1()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupNavigationItem()
        setupViews()
    }
    
    fileprivate func setupNavigationItem() {
        navigationItem.setLeftBarButtonItems([takePhotoBarButtonItem, savePhotoBarButtonItem, picBarButtonItem], animated: false)
        navigationItem.setRightBarButtonItems([uploadPhotoBarButtonItem, downloadPhotoBarButtonItem], animated: false)
    }
    
    fileprivate func setupViews() {
        view.backgroundColor = .white
        
        view.addSubview(imageView)
        view.addSubview(activityIndicator)
        
        imageView.edgesToSuperview()
        activityIndicator.centerInSuperview()
    }

    @objc fileprivate func takePhoto() {
        
        present(imagePickerController, animated: true, completion: nil)
        
        
//        func classLabel (forImage image:UIImage) -> String? {
//                if let pixelBuffer = ImageProcessor.pixelBuffer(forImage: image.cgImage!) {
//                    guard let scene = try? model.prediction(image: pixelBuffer) else {fatalError("Unexpected runtime error")}
//
//                   // print(scene.classLabel)
//                    return scene.classLabel
//
//                }
//
//                return nil
//            }
        
       
        
            }

    
    
    @objc fileprivate func savePhoto() {
        // add code here
        
       guard let image1 =  imageView.image else { return }
      activityIndicator.startAnimating()
        
     //   UIImageWriteToSavedPhotosAlbum(image, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
        
        
        
        
        
        
        func classLabel (forImage image1:UIImage) -> String? {
                      if let pixelBuffer = ImageProcessor.pixelBuffer(forImage: image1.cgImage!) {
                        guard let scene = try? model.prediction(image: pixelBuffer) else {fatalError("Unexpected runtime error")}
//                        if(scene.classLabel == "shirt" )
//                        {
//              saveToAlbum(named: "shirt", image: image)
//                        }
                        print(scene.classLabel)
                          return scene.classLabel

                      }

                      return nil
                  }

        
        
        
        
        
        
//        guard let image1 =  imageView.image else { return }
//             activityIndicator.startAnimating()
//
        
        
        
        
       // guard let image =  imageView.image else { return }
         //     activityIndicator.startAnimating()
//
        switch classLabel(forImage: image1) {
            
            
            
           
        case  let image where image == "shirt":

            saveToAlbum(named: "shirts", image: image1)
            
            case  let image where image == "tshirt":

                       saveToAlbum(named: "tshirts", image: image1)
            
            case  let image where image == "blazer":

                       saveToAlbum(named: "blazers", image: image1)
            
            case  let image where image == "kameezsalwar":

                    saveToAlbum(named: "kameezshalwars", image: image1)
            
            
         //   ***************************************************
            
            case  let image where image == "short":

                    saveToAlbum(named: "shorts", image: image1)
                       
                       
            
            
            case  let image where image == "pant":
                           saveToAlbum(named: "pants", image: image1)

            
            
            case  let image where image == "trouser":

                       saveToAlbum(named: "trousers", image: image1)
            
            
            case  let image where image == "chapal":

                                  saveToAlbum(named: "chapals", image: image1)
            
            
            case  let image where image == "snicker":

                                  saveToAlbum(named: "snickers", image: image1)
            
            
            case  let image where image == "boot":

                                  saveToAlbum(named: "boots", image: image1)
            
            
            case  let image where image == "loafer":

                                  saveToAlbum(named: "loafers", image: image1)

          //  case  let image where image == "":

                    //            saveToAlbum(named: "lower_wear", image: image1)
          



        default:
           saveToAlbum(named: "YTWC", image: image1)
        }

       
//
           // saveToAlbum(named: "YTWC", image: image)
     
        
        
        
        
        
        
    //    *************************************
        
        
        
        
        
        
    }
    
    
    @objc fileprivate func pic(){
        
        

        
        
        
    }
    
    @objc fileprivate func uploadPhoto() {
        // add code here
        activityIndicator.startAnimating()
                
        
        
        guard let image = imageView.image, let data = image.jpegData(compressionQuality: 1.0) else{
            presentAlert(title: "Error", message: "something went wrong")
            return
        }
        
        let imageName = UUID().uuidString
        
        let imageReference = Storage.storage().reference()
            .child(MyKeys.imagesFolder)
            .child(imageName)
        
        imageReference.putData(data, metadata: nil) { (metadata, err) in
            if let err = err {
                self.presentAlert(title: "error", message: err.localizedDescription)
                return
            }
            imageReference.downloadURL(completion: { (url, err) in
                if let err = err {
                               self.presentAlert(title: "error", message: err.localizedDescription)
                               return
                           }
                guard let url = url else {
                    self.presentAlert(title: "Error", message: "something went wrong")
                    return
                }
                
                let dataReference = Firestore.firestore().collection(MyKeys.imagesCollection).document()
                
                let documentUid = dataReference.documentID
                
                let urlString = url.absoluteString
                
                let data = [MyKeys.uid: documentUid,
                           MyKeys.imageUrl: urlString]
                
                dataReference.setData(data, completion: {(err) in
                    if let err = err {
                                                self.presentAlert(title: "error", message: err.localizedDescription)
                                                return
                                            }
                    UserDefaults.standard.set(documentUid, forKey: MyKeys.uid)
                  self.imageView.image = UIImage()
                    
                    self.presentAlert(title: "Success", message: "Success save image to the Database")
                    
                })
                
                
                
            })
        }
    }
    
    @objc fileprivate func downloadPhoto() {
        // add code here
        activityIndicator.startAnimating()
        
        guard let uid = UserDefaults.standard.value(forKey: MyKeys.uid) else{
            self.presentAlert(title: "Error", message: "something went wrong")
            return
        }
        let query = Firestore.firestore().collection(MyKeys.imagesCollection).whereField(MyKeys.uid, isEqualTo:  uid)
        
        query.getDocuments { (snapshot, err) in
            if let err = err {
                self.presentAlert(title: "Error", message: err.localizedDescription)
                return
            }
            guard let snapshot = snapshot,
                let data = snapshot.documents.first?.data(),
                let urlstring = data[MyKeys.imageUrl] as? String,
                let url = URL(string: urlstring) else {
                    self.presentAlert(title: "Error", message: "something went wrong")
                    return
            }
            let resource = ImageResource(downloadURL: url)
            self.imageView.kf.setImage(with: resource) { (result) in
                switch result {
                case .success(_):
                     self.presentAlert(title: "Success", message: "Success Download image to the Database")
                                       
                case .failure(let err):
                     self.presentAlert(title: "Error", message: err.localizedDescription)
                    
                }
                
            }
        }
        
        
        
    }
    
    func saveToAlbum(named: String, image: UIImage) {
        // add code here
        let album = CustomAlbum(name: named)
              album.save(image: image) { (result) in
                DispatchQueue.main.async {
                switch result {
                case .success(_):
                    self.presentAlert(title: "Success", message: "Successfully save photo to album \"\(named)\"")
                case .failure(let err):
                    self.presentAlert(title: "Error", message: err.localizedDescription)
                }
              }
        }
    }
    
    @objc func image(_ image: UIImage, didFinishSavingWithError err: Error?, contextInfo: UnsafeRawPointer) {
        activityIndicator.stopAnimating()
        if let err = err {
            // we got back an error!
            presentAlert(title: "Error", message: err.localizedDescription)
        } else {
            presentAlert(title: "Saved!", message: "Image saved successfully")
        }
    }
    
    func presentAlert(title: String, message: String) {
        activityIndicator.stopAnimating()
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
 
}


extension RootViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else {
            print("Image not found!")
            return
        }
        imageView.image = selectedImage
        
        imagePickerController.dismiss(animated: true, completion: nil)
    }
}


