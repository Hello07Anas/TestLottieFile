//
//  ViewController.swift
//  TestLottieFile
//
//  Created by anas on 23/10/2024.
//

import UIKit
import Lottie

class ViewController: UIViewController {

    @IBOutlet weak var selectLottieFileOT: UISegmentedControl!
    @IBOutlet weak var animationContainerView: UIView!
    
    private var animationView: LottieAnimationView!
    let lootiesFileNames = ["Cart", "Fav", "Network", "Address_file", "Order_History"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpAnimation(with: lootiesFileNames[0])
    }
    
    func setUpAnimation(with fileName: String) {
        // Remove the current animation view, if it exists
        animationView?.removeFromSuperview()
        
        // Initialize a new animation view
        animationView = LottieAnimationView(name: fileName)
        
        guard let animationView = animationView else { return }
        
        // Set the frame to match the container view
        animationView.frame = animationContainerView.bounds
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.animationSpeed = 1.0
        
        // Add animation view to the container view
        animationContainerView.addSubview(animationView)
        
        // Play the animation
        animationView.play()
    }

    @IBAction func selectLottieFile(_ sender: Any) {
        if let segmentedControl = sender as? UISegmentedControl {
            let selectedIndex = segmentedControl.selectedSegmentIndex
            let selectedFileName = lootiesFileNames[selectedIndex]
            setUpAnimation(with: selectedFileName)
        } else {
            print("Issue")
        }
    }
    
}


