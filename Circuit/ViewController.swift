//
//  ViewController.swift
//  Circuit
//
//  Created by Ghazanfar, Uzma on 10/11/17.
//  Copyright © 2017 Ghazanfar, Uzma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let background: UIImageView
    private let circuiTitle: UIImageView
    private let quickPlayButton: UIButton
    private var quickPlayImage: UIImage
    private let levelPlayButton: UIButton
    private var levelPlayImage: UIImage
    let lsc: LevelController
    
    init(){
        
        background = UIImageView()
        circuiTitle = UIImageView()
        quickPlayButton = UIButton()
        quickPlayImage = UIImage()
        levelPlayButton = UIButton()
        levelPlayImage = UIImage()
        lsc = LevelController(string: "Level Controller")
        
        // initializes the object - UIViewController - from superclass in subclass constructor
        super.init(nibName: nil, bundle: nil)
        
        let screenSize: CGSize = UIScreen.main.bounds.size
        // create variables that save the mid point of the screen - by width and height
        let centerX: CGFloat = screenSize.width/2
        let centerY: CGFloat = screenSize.height/2
        
//      ------------------------------------------------------------
        
        background.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height)
        background.image = UIImage(named: "Artwork.png")
        background.isHidden = false
        self.view.addSubview(background)
        
//      ------------------------------------------------------------
        
        circuiTitle.frame = CGRect(x: centerX - 150, y: centerY - 200, width: 300, height: 77)
        circuiTitle.image = UIImage(named: "circuitWhole.png")
        circuiTitle.isHidden = false
        self.view.addSubview(circuiTitle)
        
//      ------------------------------------------------------------
        
        quickPlayImage = UIImage(named: "quickstart.png")!
        quickPlayButton.setImage(quickPlayImage, for: UIControlState.normal)
        quickPlayButton.frame = CGRect(x: centerX - 112, y: centerY - 60, width: 225, height: 27)
        quickPlayButton.isUserInteractionEnabled = true
        quickPlayButton.addTarget(self, action: #selector(ViewController.quickbuttonPressed), for: UIControlEvents.touchUpInside)
        self.view.addSubview(quickPlayButton)
        
//      ------------------------------------------------------------
        
        levelPlayImage = UIImage(named: "LEVELS.png")!
        levelPlayButton.setImage(levelPlayImage, for: UIControlState.normal)
        levelPlayButton.frame = CGRect(x: centerX - 78, y: centerY, width: 156, height: 27)
        levelPlayButton.isUserInteractionEnabled = true
        levelPlayButton.addTarget(self, action: #selector(ViewController.levelbuttonPressed), for: UIControlEvents.touchUpInside)
        self.view.addSubview(levelPlayButton)
        
        //      ------------------------------------------------------------
        
    }
    
//      ------------------------------------------------------------
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func quickbuttonPressed(){
        let qsc: QuickStartController = QuickStartController(string: "Quick Start Controller")
        qsc.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        self.present(qsc, animated: true) { () -> Void in
//            NSLog("Secondary view controller presented...")
        }

    }
    
    @objc func levelbuttonPressed(){
        lsc.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        self.present(lsc, animated: true) { () -> Void in
            //            NSLog("Secondary view controller presented...")
        }

    }

}
