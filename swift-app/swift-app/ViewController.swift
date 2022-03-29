//
//  ViewController.swift
//  swift-app
//
//  Created by a-robot on 3/28/22.
//

import UIKit
import RealityKit
import ARKit
 
// create model entity, then anchor entity, and then add to scene.
class ViewController: UIViewController {
    
    @IBOutlet var arView: ARView!
    
    override func viewDidAppear(_ _animated: Bool) {
        super.viewDidAppear(_animated)
        
        arView.session.delegate = self

        setupARView()
    
        // ar laser to reconize objects / surfaces
        arView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap(recognizer:))))
    }
    
    
    // methods to set up ar
    func setupARView(){
        arView.automaticallyConfigureSession = false
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal, .vertical]
        config.environmentTexturing = .automatic
        arView.session.run(config)
    }
    
    // Object placement -> when a tap is initiated, this method is initilized.
    @objc
    func handleTap(recognizer: UITapGestureRecognizer){
        let location = recognizer.location(in: arView)
        let results = arView.raycast(from: location, allowing: .estimatedPlane, alignment: .horizontal )
        
        // conditional if horizontal surface is found. --> hooks into anchor
        if let firstResult = results.first {
            let anchor = ARAnchor(name: "Object", transform: firstResult.worldTransform)
            arView.session.add(anchor: anchor)
            print("[+] Surface Found! ")

        }else{
            print("[-] Cannot Find Surface.. ")
        }
    }
    
        // Create model entitties, then anchor entitty, then its added back to the scene.
    func placeObject(named entityName: String, for anchor: ARAnchor){
   
        let entity = try! ModelEntity.loadModel(named: entityName)
        
        entity.generateCollisionShapes(recursive: <#T##Bool#>)
        arView.installGestures([.rotation, .translation], for: entity)
    
        let anchorEntity = AnchorEntity(anchor: anchor)
        anchorEntity.addChild(entity)
        arView.scene.addAnchor(anchorEntity)
        
}
}

extension ViewController: ARSessionDelegate{
    func session(_ session: ARSession, didAdd anchors: [ARAnchor]){
        for anchor in anchors{
            if let anchorName = anchor.name, anchorName == "Object"{
                placeObject(named: anchorName, for: anchor)
                
            }
        }
    }
}
