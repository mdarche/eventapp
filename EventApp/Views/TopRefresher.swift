//
//  TopRefresher.swift
//  EventApp
//
//  Created by Michael Darche on 6/21/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import UIKit

class TopRefresher: UIRefreshControl {
    
    private var refreshLoadingView : UIView!
    private var refreshColorView : UIView!
    
    private var isRefreshIconsOverlap = false
    private var isRefreshAnimating = false
    
    var indicatorColor : UIColor?
    var bgColor : UIColor?
    
    func setupSubview () {
        refreshLoadingView = UIView(frame: self.bounds)
        refreshLoadingView.backgroundColor = UIColor.whiteColor()
        refreshColorView = UIView(frame: self.bounds)
        refreshColorView.backgroundColor = UIColor.clearColor()
        refreshColorView.alpha = 0.80
        
        refreshLoadingView.clipsToBounds = true;
        
        // Hide the original spinner icon
        tintColor = UIColor.blackColor()
        
        addSubview(self.refreshColorView)
        addSubview(self.refreshLoadingView)
        
        // Initalize flags
        isRefreshIconsOverlap = false;
        isRefreshAnimating = false;
    }
    
    func scrollTableView () {
        var refreshBounds = self.bounds;
        let pullDistance = max(0.0, -self.frame.origin.y);
        
        // Set the encompassing view's frames
        refreshBounds.size.height = pullDistance;
        
        refreshColorView.frame = refreshBounds;
        refreshLoadingView.frame = refreshBounds;
        
        if (self.refreshing && !self.isRefreshAnimating) {
            self.animateRefreshView()
        }
        
    }
    
    func animateRefreshView() {
        refreshLoadingView.backgroundColor = UIColor.clearColor()
        var colorArray = [UIColor.redColor(), UIColor(red: 114/255, green: 5/255, blue: 229/255, alpha: 1.0), UIColor.greenColor(), UIColor(red: 232/255, green: 28/255, blue: 217/255, alpha: 1.0), UIColor.magentaColor()]
        struct ColorIndex {
            static var colorIndex = 0
        }
        isRefreshAnimating = true
        
        UIView.animateWithDuration(
            Double(0.28),
            delay: Double(0.0),
            options: UIViewAnimationOptions.CurveLinear,
            animations: {
                self.refreshColorView!.backgroundColor = colorArray[ColorIndex.colorIndex]
                ColorIndex.colorIndex = (ColorIndex.colorIndex + 1) % colorArray.count
            },
            completion: { finished in
                // If still refreshing, keep spinning, else reset
                if (self.refreshing) {
                    self.animateRefreshView()
                }else {
                    self.resetAnimation()
                }
            }
        )
    }
    
    func resetAnimation() {
        refreshLoadingView.backgroundColor = UIColor.whiteColor()
        isRefreshAnimating = false;
        isRefreshIconsOverlap = false;
        refreshColorView.backgroundColor = UIColor.clearColor()
    }
    
}