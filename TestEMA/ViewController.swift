//
//  ViewController.swift
//  TestEMA
//
//  Created by Varun Mishra on 8/22/19.
//  Copyright © 2019 Varun Mishra. All rights reserved.
//

import UIKit
import ResearchKit

class ViewController: UIViewController {

    @IBAction func startEMA(_ sender: Any) {
        let survey = EMATask().makeTask()
        showTask(survey)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    private func showTask(_ task: ORKTask) {
        let taskViewController = ORKTaskViewController(task: task, taskRun: nil)
        taskViewController.delegate = self
        present(taskViewController, animated: true, completion: nil)
    }
}

extension ViewController: ORKTaskViewControllerDelegate {
    func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?) {
        
        print("Got the results: \(taskViewController.result)")
        
        dismiss(animated: true, completion: nil)
    }
}

