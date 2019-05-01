//
//  SquareTapVC.swift
//  FizBuz
//
//  Created by Bharath on 23/04/19.
//  Copyright © 2019 TestCompany. All rights reserved.
//


import UIKit

class SquareTapVC: UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()

        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        tap.numberOfTapsRequired = 1
        self.view.addGestureRecognizer(tap)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        for view in self.view.subviews {
            view.removeFromSuperview()
        }
    }
    
    
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        print("You tapped")
        
        
        guard sender.view != nil else { return }
        //        drawRectangle()
        if sender.state == .ended
        {      
            let touchPoint = sender.location(in: self.view)
            let DynamicView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
            let point = CGPoint(x: touchPoint.x, y: touchPoint.y)
            DynamicView.center.y = point.y
            DynamicView.center.x = 0
            DynamicView.backgroundColor=UIColor.cyan
            //        DynamicView.layer.cornerRadius=25
            DynamicView.layer.borderWidth=2
            
            let anArrayOfSubViews = self.view.subviews
            
            print("The number fo subviews are: \(anArrayOfSubViews.count)")
            var flag = true
            
            for tempView in anArrayOfSubViews{
                if(tempView.frame.contains(point)){
                    print("View already exists at this poin")
                    flag = false
                }
                
            }
            
            if flag
            {
                self.view.addSubview(DynamicView)
                
                let animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeInOut, animations: {
                    
                    DynamicView.center.x += point.x
//                    DynamicView.center.y -= self.view.bounds.width
                })
                animator.startAnimation()
                
                
            }
        }
        
    }
    
        
}
