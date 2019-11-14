//
//  QRCodeViewController.swift
//  ExerciseRx
//
//  Created by OCEO on 10/21/19.
//  Copyright © 2019 OCEO. All rights reserved.
//

import UIKit
import Photos
import AVFoundation

class QRCodeViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
    @IBOutlet weak var camView: UIImageView!
    @IBOutlet weak var qrLabel: UILabel!
    @IBOutlet weak var takePictureButton: UIButton!
    
    var captureSession = AVCaptureSession()
    
    var backCamera: AVCaptureDevice?
    var frontCamera: AVCaptureDevice?
    var currentCamera: AVCaptureDevice?
    
    var photoOutput: AVCapturePhotoOutput?
    
    var cameraPreviewLayer: AVCaptureVideoPreviewLayer?


    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCaptureSession()
        setupDevice()
        setupInputOutput()
        setupPreviewLayer()
        startRunningCaptureSession()


        // Do any additional setup after loading the view.
    }
    /* Function: before starting taking a photo, set up the AVCaptureSession to take a photo during this view */
    func setupCaptureSession() {
        captureSession.sessionPreset = AVCaptureSession.Preset.photo
    }
    func setupDevice() {
        
        /* set up to find out the current device's camera and make it type as vide
         * Also, set the position unknown to set up later to find which camera user wants to use */
        let deviceDiscoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [AVCaptureDevice.DeviceType.builtInWideAngleCamera], mediaType: AVMediaType.video, position: AVCaptureDevice.Position.unspecified)
        
        /* create the deviceDiscoverySession to get all the front and back camera */
        let devices = deviceDiscoverySession.devices
        
        
        /* check the camera's postion and set up the camera */
        for device in devices{
            if device.position == AVCaptureDevice.Position.back {
                print("back")
                backCamera = device
            } else if device.position == AVCaptureDevice.Position.front {
                frontCamera = device
                print("front")
            }
        }
        
        /* For now, just using a back side of camera */
        currentCamera = backCamera
    }
    /* Function: before starting taking a photo, set up the Input (current using camera) and Output (how to make a image) */
    func setupInputOutput() {
        
        do{
            /* set the input as current camera, so the current camera would be in the current capture session
             * session is like a thread */
            let captureDeviceInput = try AVCaptureDeviceInput(device: currentCamera!)
            captureSession.addInput(captureDeviceInput)
            /* set the output as a jpeg format and the output would be in the current caputure session */
            photoOutput = AVCapturePhotoOutput()
            photoOutput?.setPreparedPhotoSettingsArray([AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.jpeg])], completionHandler: nil)
            captureSession.addOutput(photoOutput!)
            
        } catch{
            print(error)
        }
        
    }
    
    /* Function: before starting taking a photo, set up the layer to get the camera view */
    func setupPreviewLayer() {
        
        /* create the AVcaptureVideoPreviewLayer which is the current camera view
         * it's gravity would be aspect fill with proper ratio and the orientation would be portrait
         * and add the camera view to its current view in the TakePictureViewController */
        cameraPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        cameraPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
        cameraPreviewLayer?.connection?.videoOrientation = AVCaptureVideoOrientation.portrait
        cameraPreviewLayer?.frame = self.view.frame
        camView.layer.insertSublayer(cameraPreviewLayer!, at: 1)
        
    }
    
    /* Function: if all the sessions, device, input, and output is ready, then begin the session that contains
     * all the information about the camera settings */
    func startRunningCaptureSession() {
        captureSession.startRunning()
    }

    @IBAction func Take_Picture_Button_TouchUpInside(_ sender: Any) {
        let settings = AVCapturePhotoSettings()
        
        photoOutput?.capturePhoto(with: settings, delegate: self)

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
extension QRCodeViewController: AVCapturePhotoCaptureDelegate {
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        if let imageData = photo.fileDataRepresentation(){
            print(imageData)
//            images = UIImage(data: imageData)
            performSegue(withIdentifier: "111", sender: nil)
        }
    }
    
}
