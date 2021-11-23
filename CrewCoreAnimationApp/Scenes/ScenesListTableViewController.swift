//
//  ScenesListTableViewController.swift
//  TestCoreAnimationApp
//
//  Created by Gregory Berngardt on 14.11.2021.
//

import UIKit

class ScenesListTableViewController: UITableViewController {

    struct SceneModel {
        let name: String
        let vc: UIViewController.Type
    }
    
    private let scenes = [
        SceneModel(name: "IA #1", vc: Scene1ViewController.self),
        SceneModel(name: "IA #2", vc: Scene2ViewController.self),
        SceneModel(name: "EA #1 Basic", vc: Scene3ViewController.self),
        SceneModel(name: "EA #2 Keyframe", vc: Scene4ViewController.self),
        SceneModel(name: "EA #3 Timing", vc: Scene5ViewController.self),
        SceneModel(name: "EA #4 Groups", vc: Scene6ViewController.self)
    ]

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        scenes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        var content = cell.defaultContentConfiguration()
        content.text = scenes[indexPath.row].name
        cell.contentConfiguration = content
        
        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let scene = scenes[indexPath.row]
        let vc = scene.vc.init()
        vc.title = scene.name
        navigationController?.pushViewController(vc, animated: true)
    }

}
