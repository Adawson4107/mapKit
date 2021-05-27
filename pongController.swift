//
//  pongController.swift
//  Games
//
//  Created by period3 on 5/17/21.
//

import UIKit
import AVFoundation
class pongController: UIViewController, UICollisionBehaviorDelegate {
    @IBOutlet weak var paddleView: UIView!
    @IBOutlet weak var paddleView2: UIView!
    @IBOutlet weak var ballView: UIView!
    @IBOutlet weak var startButton: UIButton!
    
   
    var dynamicAnimator: UIDynamicAnimator!
    var pushBehavior: UIPushBehavior!
    var collisionBehavior: UICollisionBehavior!
    var ballDynamicBehavior: UIDynamicItemBehavior!
    var paddleDynamicBehavior: UIDynamicItemBehavior!
    var paddle2DynamicBehavior: UIDynamicItemBehavior!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        ballView.layer.masksToBounds = true
        ballView.layer.cornerRadius = 20
        }
    
    
    
    @IBAction func movePaddle(_ sender: UIPanGestureRecognizer) {
        paddleView.center = CGPoint(x: sender.location(in: view).x, y: paddleView.center.y)
        dynamicAnimator.updateItem(usingCurrentState: paddleView)
    }
    
    @IBAction func movePaddle2(_ sender: UIPanGestureRecognizer) {
        paddleView2.center = CGPoint(x: sender.location(in: view).x, y: paddleView.center.y)
        dynamicAnimator.updateItem(usingCurrentState: paddleView2)
    }
    
    
    
    
    
    
        func dynamicBehaviors(){
            dynamicAnimator = UIDynamicAnimator(referenceView: view)
            pushBehavior = UIPushBehavior(items: [ballView], mode: .instantaneous)
            pushBehavior.active = true
            pushBehavior.pushDirection = CGVector(dx: 0.7, dy: 0.6)
            pushBehavior.magnitude = 0.3
            dynamicAnimator.addBehavior(pushBehavior)
            
            collisionBehavior = UICollisionBehavior(items: [paddleView, paddleView2, ballView])
            collisionBehavior.collisionMode = .everything
            collisionBehavior.translatesReferenceBoundsIntoBoundary = true
            dynamicAnimator.addBehavior(collisionBehavior)
            collisionBehavior.collisionDelegate = self
            
            ballDynamicBehavior = UIDynamicItemBehavior(items: [ballView])
            ballDynamicBehavior.allowsRotation = true
            ballDynamicBehavior.elasticity = 1.0
            ballDynamicBehavior.friction = 0
            ballDynamicBehavior.resistance = 0
            dynamicAnimator.addBehavior(ballDynamicBehavior)
            
            paddleDynamicBehavior = UIDynamicItemBehavior(items: [paddleView])
            paddleDynamicBehavior.density = 1000.0
            paddleDynamicBehavior.allowsRotation = false
            dynamicAnimator.addBehavior(paddleDynamicBehavior)
    
            paddle2DynamicBehavior = UIDynamicItemBehavior(items: [paddleView2])
            paddle2DynamicBehavior.density = 1000.0
            paddle2DynamicBehavior.allowsRotation = false
            dynamicAnimator.addBehavior(paddle2DynamicBehavior)
    
        }
    @IBAction func startButton(_ sender: UIButton) {
        dynamicBehaviors()
        paddleView.isHidden = false
        ballView.isHidden = false
        sender.isHidden = true
        let sound = AVSpeechSynthesizer()
        let utter = AVSpeechUtterance(string: "start the game")
        sound.speak(utter)
        }
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint) {
    if p.y > paddleView.center.y {
        }
   }
    
    
    
    
        }
   
    
    








