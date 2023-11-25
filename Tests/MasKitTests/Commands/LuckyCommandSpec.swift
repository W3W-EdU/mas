//
//  LuckyCommandSpec.swift
//  MasKitTests
//
//  Created by Ben Chatelain on 2018-12-28.
//  Copyright © 2018 mas-cli. All rights reserved.
//

import Nimble
import Quick

@testable import MasKit

public class LuckyCommandSpec: QuickSpec {
    override public func spec() {
        let networkSession = NetworkSessionMockFromFile(responseFile: "search/slack.json")
        let storeSearch = MasStoreSearch(networkManager: NetworkManager(session: networkSession))

        beforeSuite {
            MasKit.initialize()
        }
        describe("lucky command") {
            it("installs the first app matching a search") {
                let cmd = LuckyCommand(storeSearch: storeSearch)
                let result = cmd.run(LuckyCommand.Options(appName: "Slack", forceInstall: false))
                expect(result).to(beSuccess())
            }
        }
    }
}
