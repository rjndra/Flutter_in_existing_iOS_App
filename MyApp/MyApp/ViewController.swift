//
//  ViewController.swift
//  MyApp
//
//  Created by Office on 1/2/20.
//  Copyright © 2020 Office. All rights reserved.
//

import UIKit
import Flutter

enum ChannelName {
    static let battery = "samples.rajendra.com/battery"
    static let charging = "samples.rajendra.com/charging"
    static let secondViewController = "samples.rajendra.com/svc"
}

enum MyFlutterErrorCode {
    static let unavailable = "UNAVAILABLE"
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Make a button to call the showFlutter function when pressed.
        let button = UIButton(type:UIButton.ButtonType.custom)
        button.addTarget(self, action: #selector(showFlutter), for: .touchUpInside)
        button.setTitle("Show Flutter!", for: UIControl.State.normal)
        button.frame = CGRect(x: 80.0, y: 210.0, width: 160.0, height: 40.0)
        button.center = self.view.center
        button.backgroundColor = UIColor.blue
        self.view.addSubview(button)
    }
    
    @objc func showFlutter() {
        let flutterEngine = (UIApplication.shared.delegate as! AppDelegate).flutterEngine
        let flutterViewController =
            FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
        flutterViewController.modalPresentationStyle = .fullScreen
        self.show(flutterViewController, sender: self)
        self.navigationController?.navigationBar.isHidden = true
        //      present(flutterViewController, animated: true, completion: { [weak self] in
        //        self?.setupRouteBack()
        //      })
        self.setupRouteBack(to: flutterViewController)
    }
    
    func setupRouteBack(to flutterViewController: FlutterViewController? = nil) {
        
        guard let controller : FlutterViewController = appDelegate.window?.rootViewController as? FlutterViewController ?? self.presentedViewController as? FlutterViewController ?? flutterViewController else {
            return
        }
        let routeChannel = FlutterMethodChannel(name: ChannelName.secondViewController,
                                                binaryMessenger: controller.binaryMessenger)
        routeChannel.setMethodCallHandler({ [weak self]
            (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            
            guard call.method == "routeToSecondViewController" else {
                result(FlutterMethodNotImplemented)
                return
            }
            self?.receiveRouteMessage(result: result)
        })
        
    }
    
    private func receiveRouteMessage(result: FlutterResult) {
        self.navigationController?.navigationBar.isHidden = false
        guard let vc = self.storyboard?.instantiateViewController(identifier: "SecondViewController") as? SecondViewController else {
            result(FlutterError(code: MyFlutterErrorCode.unavailable,
                                message: "Second ViewController unavailable",
                                details: nil))
            result(FlutterMethodNotImplemented)
            return
        }
        result(true)
        vc.modalPresentationStyle = .fullScreen
        //        self.present(vc, animated: true, completion: nil)
        self.show(vc, sender: self)
    }
    
}

