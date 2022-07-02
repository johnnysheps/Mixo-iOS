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
let devMode = true; // faster UX flow by automatically skipping irrelevant screens inbetween, like before-breathing screen and giving you the button to skip the breathing screen (rather than forcing you to wait)
let skipToScreen = false; // if true, go to ViewController.swift:skipToScreenAt() to setup which screen. Load test driven screens here if applicable.
let autoLogin = true; // if true, automatically logs in and goes to relevant screen after logging in. Setup your credentials at ViewController.swift searching for "autologin"


class TestApp {


}
