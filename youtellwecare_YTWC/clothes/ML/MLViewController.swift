//
//  MLViewController.swift
//  youtellwecare_YTWC
//
//  Created by noshair on 18/01/2020.
//  Copyright © 2020 ucp. All rights reserved.

import UIKit
import AVKit
import Vision

class MLViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
    
    let identifierLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let captureSession = AVCaptureSession()
        captureSession.sessionPreset = .photo
        
        guard let captureDevice = AVCaptureDevice.default(for: .video) else { return }
        guard let input = try? AVCaptureDeviceInput(device: captureDevice) else { return }
        captureSession.addInput(input)
        
        captureSession.startRunning()
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        view.layer.addSublayer(previewLayer)
        previewLayer.frame = view.frame
        
        let dataOutput = AVCaptureVideoDataOutput()
        dataOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoQueue"))
        captureSession.addOutput(dataOutput)
        
        
//     VNImageRequestHandler(cgImage: <#T##CGImage#>, options: [:]).perform(<#T##requests: [VNRequest]##[VNRequest]#>)
        
        setupIdentifierConfidenceLabel()
    }
    
    fileprivate func setupIdentifierConfidenceLabel() {
        view.addSubview(identifierLabel)
        identifierLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32).isActive = true
        identifierLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        identifierLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        identifierLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
//        print("Camera was able to capture a frame:", Date())
        
        guard let pixelBuffer: CVPixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
        
        // !!!Important
        // make sure to go download the models at https://developer.apple.com/machine-learning/ scroll to the bottom
        guard let model = try? VNCoreMLModel(for:
            youtellwecare_YTWC_ML_1().model) else { return }
        let request = VNCoreMLRequest(model: model)
           { (finishedReq, err) in
            
            //perhaps check the err
            
//            print(finishedReq.results)
            
            guard let results = finishedReq.results as? [VNClassificationObservation] else { return }
            
            guard let firstObservation = results.first else { return }
            
            print(firstObservation.identifier, firstObservation.confidence)
            
            DispatchQueue.main.async {
                self.identifierLabel.text = "\(firstObservation.identifier) \(firstObservation.confidence * 100)"
            }
            
        }
        
        try? VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:]).perform([request])
    }

    
    

    
}


//
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//

//import UIKit
//
//class MLViewController: UIViewController {
//
//    @IBOutlet weak var categoryLabel: UILabel!
//
//    let model = ytwcML_1()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//    }
//
//    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
//        let imageView = sender.view as? UIImageView
//
//        if let imageToAnalyse = imageView?.image {
//            if let classLabelString = classLabel(forImage: imageToAnalyse) {
//                categoryLabel.text = classLabelString
//            }
//        }
//
//
//    }
//
//    func classLabel (forImage image:UIImage) -> String? {
//        if let pixelBuffer = ImageProcessor.pixelBuffer(forImage: image.cgImage!) {
//            guard let scene = try? model.prediction(image: pixelBuffer) else {fatalError("Unexpected runtime error")}
//
//            print(scene.classLabel)
//            return scene.classLabel
//
//        }
//
//        return nil
//    }
//
//
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//
//}
//
//
//
