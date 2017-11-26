//
//  AdMob.swift
//  Insurhelp
//
//  Created by George on 26/11/2017.
//  Copyright © 2017 George Zaimis. All rights reserved.
//

import UIKit
import GoogleMobileAds


class AdMob: UIViewController {
    var bannerView = GADBannerView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let req = GADRequest()
        
        req.testDevices = [kGADSimulatorID]

        bannerView = GADBannerView(adSize: kGADAdSizeBanner)
        
        addBannerView(bannerView)
        
    }
    
    func addBannerView(_ banner: GADBannerView){
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bannerView)
        view.addConstraints(
            [NSLayoutConstraint(item: bannerView,
                                attribute: .bottom,
                                relatedBy: .equal,
                                toItem: bottomLayoutGuide,
                                attribute: .top,
                                multiplier: 1,
                                constant: 0),
             NSLayoutConstraint(item: bannerView,
                                attribute: .centerX,
                                relatedBy: .equal,
                                toItem: view,
                                attribute: .centerX,
                                multiplier: 1,
                                constant: 0)
            ])
    }


}
