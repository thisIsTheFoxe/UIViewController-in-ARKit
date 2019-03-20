import PlaygroundSupport
import ARKit

class VC: UIViewController{ //some normal
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rec = UITapGestureRecognizer(target: self, action: #selector(VC.a))
        //vvvvvv does NOT work
        //view.addGestureRecognizer(rec)
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        label.addGestureRecognizer(rec)
        label.center = view.center
        label.font = UIFont.systemFont(ofSize: 50)
        label.textColor = .red
        label.text = "HAHAHA!"
        view.backgroundColor = .yellow
        view.addSubview(label)
    }
    
     //works as well
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(touches.first?.location(in: view) as Any)
    }
    
    //WORKS!! OwO
    @objc func a(sender: UITapGestureRecognizer) {
        print(sender.location(in: view))
    }
}



let vc = VC()

let plane = SCNPlane(width: 0.5, height: 0.5)
plane.materials.first?.diffuse.contents = vc.view

let cam = SCNNode()
cam.position = SCNVector3(0, 0, 0)
cam.camera = SCNCamera()

let pNore = SCNNode(geometry: plane)
pNore.position = SCNVector3(0, 0, -100)
let scnV = ARSCNView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
scnV.scene.rootNode.camera = cam.camera
scnV.scene.rootNode.addChildNode(pNore)
scnV.allowsCameraControl = true

//DON'T SET THE LIVE VIEW TO ANYTHING ELSE!! EVER!!!! JUST CRAMP EVERYTHING INTO THE FREAKIN LIVEVIEW.SWIFT AND PRETEND U DONT CARE!!!! WTF PG?!?
//actually I have no freakin' idea anymore pls help me quit lif naoo....
PlaygroundPage.current.liveView = scnV
