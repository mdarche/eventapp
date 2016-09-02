//
//  TopRefresher.swift
//  EventApp
//
//  Created by Michael Darche on 6/21/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import UIKit

class TopRefresher: UIRefreshControl {
    
    private var refreshLoadingView: UIView!
    private var refreshColorView: UIView!
    
    private var isRefreshIconsOverlap = false
    private var isRefreshAnimating = false
    
    var indicatorColor = UIColor.whiteColor()
    var bgColor = UIColor.whiteColor()
    
    
    func setupSubview(indicatorColor: UIColor, bgColor: UIColor) {
        
        self.indicatorColor = indicatorColor
        self.bgColor = bgColor
        
        refreshLoadingView = UIView(frame: self.bounds)
        refreshLoadingView.backgroundColor = self.bgColor
        refreshColorView = UIView(frame: self.bounds)
        refreshColorView.backgroundColor = UIColor.clearColor()
        refreshColorView.alpha = 0.80
        
        refreshLoadingView.clipsToBounds = true;
        
        // Hide the original spinner icon
        tintColor = indicatorColor
        
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
        var colorArray = [Colors.primaryBlue, Colors.accentRed]
        struct ColorIndex {
            static var colorIndex = 0
        }
        isRefreshAnimating = true
        
        UIView.animateWithDuration(
            Double(0.35),
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
        refreshLoadingView.backgroundColor = bgColor
        isRefreshAnimating = false;
        isRefreshIconsOverlap = false;
        refreshColorView.backgroundColor = UIColor.clearColor()
    }
    
}