//
//  ViewController.swift
//  OpenCVCanny
//
//  Created by Gilberto Arguiz on 21/4/23.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var buttonStartStop: UIButton!
    var videoCameraWrapper : OpenCVWrapper!
    
    var videoIsRunning = false {
        didSet {
            if videoIsRunning {
                buttonStartStop.setTitle("Parar", for: .normal)
            } else {
                buttonStartStop.setTitle("Iniciar", for: .normal)
            }
        }
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        get { return .portrait }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.videoCameraWrapper = OpenCVWrapper(imageView:image)

        // Setting it here to trigger the property listener to set button title
        videoIsRunning = false
        
        
        
        }

    @IBAction func onStartPressed(_ sender: Any) {
        if (!videoIsRunning) {
            self.videoCameraWrapper.startCamera()
        } else {
            self.videoCameraWrapper.stopCamera()
        }
        videoIsRunning = !videoIsRunning
    }
    
    
    @IBAction func blur(_ sender: UISlider) {
        videoCameraWrapper.setBlur(Int32(sender.value))
    }
    
    
    @IBAction func edgeGradient(_ sender: UISlider) {
        videoCameraWrapper.setEdgeGradient(Int32(Int(sender.value) * 2 + 3))
    }
    
    @IBAction func angle(_ sender: UISlider) {
        videoCameraWrapper.setAngle(Int32(sender.value))
    }
    
}

