//
//  ObjectViewController.swift
//  GradutaionProject
//
//  Created by JOSUEYEON on 2023/05/25.
//

import UIKit
import SceneKit
import ARKit

class ObjectViewController: UIViewController, ARSCNViewDelegate {
    var sceneView = ARSCNView()
    let scene = SCNScene()
    let material = SCNMaterial()
    var img: UIImage?
    
    init(img: UIImage?) {
        self.img = img
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(didTapBackBtn))
        
        self.view.addSubview(sceneView)
        sceneView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        sceneView.delegate = self
        sceneView.showsStatistics = true
        material.diffuse.contents = self.img
        sceneView.scene = scene
        
        addObjects(x: 0, y: 0.1, z: -0.5)
    }
    
    private func addObjects(x: Float, y: Float, z: Float) {
        let box = SCNBox(width: 0.3, height: 0.3, length: 0.2, chamferRadius: 0)

        let node = SCNNode()
        node.geometry = box
        node.geometry?.materials = [material]
        node.position = SCNVector3(x, y, z)
    
        scene.rootNode.addChildNode(node)
    }
    
    @objc func didTapBackBtn(_ sender: UIBarButtonItem) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}

