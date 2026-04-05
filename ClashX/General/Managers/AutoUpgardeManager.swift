//
//  AutoUpgardeManager.swift
//  ClashX
//
//  Created by yicheng on 2019/10/28.
//  Copyright © 2019 west2online. All rights reserved.
//

import Cocoa
import Sparkle

class AutoUpgardeManager: NSObject {
    static let shared = AutoUpgardeManager()

    private let updaterController: SPUStandardUpdaterController

    override private init() {
        updaterController = SPUStandardUpdaterController(
            startingUpdater: true,
            updaterDelegate: nil,
            userDriverDelegate: nil
        )
        super.init()
    }

    // MARK: Public

    func setup() {}

    func setupCheckForUpdatesMenuItem(_ item: NSMenuItem) {
        item.target = self
        item.action = #selector(checkForUpdates(_:))
    }

    @objc func checkForUpdates(_ sender: Any) {
        NSApp.activate(ignoringOtherApps: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in
            self?.updaterController.checkForUpdates(sender)
        }
    }

    func addChannelMenuItem(_ button: NSPopUpButton) {}

    var updater: SPUUpdater {
        updaterController.updater
    }
}
