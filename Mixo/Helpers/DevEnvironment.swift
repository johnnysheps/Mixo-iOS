//
//  TestApp.swift
//  Mixo
//
//  Created by Weng on 6/23/22.
//  Copyright © 2022 Sean Hall. All rights reserved.
//

import Foundation
/* Important. Set environment!
 * If development mode, then we can code screen skips for faster testing
 */

// productionMode is quick easy set them all false
let productionMode = true

var fasterUX = false; // faster UX flow by automatically skipping irrelevant screens inbetween, like before-breathing scre    en and giving you the button to skip the breathing screen (rather than forcing you to wait)
var autoLogin = false; // if true, automatically logs in and goes to relevant screen after logging in. Setup your credentials at ViewController.swift searching for "autologin"

var skipToTestScreen = false; // if true, skip to a particular test screen. Setup which test scene at ViewController.swift:skipToTestScreenAt(). Higher priority.
var skipToScreen = false; // if true, skip to a particular screen. Setup which scene at ViewController.swift:skipToScreenAt(). Lower priority.


class DevEnvironment {


}
