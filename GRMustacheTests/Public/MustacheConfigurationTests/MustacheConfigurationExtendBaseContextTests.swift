//
//  MustacheConfigurationExtendBaseContextTests.swift
//  GRMustache
//
//  Created by Gwendal Roué on 05/11/2014.
//  Copyright (c) 2014 Gwendal Roué. All rights reserved.
//

import XCTest

class MustacheConfigurationExtendBaseContextTests: XCTestCase {
   
    func testConfigurationExtendBaseContextWithValue() {
        var configuration = MustacheConfiguration()
        configuration.extendBaseContextWithValue(MustacheValue(["name": "Arthur"]))
        let repository = MustacheTemplateRepository()
        repository.configuration = configuration
        let template = repository.template(string: "{{name}}")!
        
        var rendering = template.render(MustacheValue())!
        XCTAssertEqual(rendering, "Arthur")
        
        rendering = template.render(MustacheValue(["name": "Bobby"]))!
        XCTAssertEqual(rendering, "Bobby")
    }
    
    func testConfigurationExtendBaseContextWithProtectedObject() {
        // TODO: import test from GRMustache
    }
    
    func testConfigurationExtendBaseContextWithTagObserver() {
        class TestedTagObserver: MustacheTagObserver {
            func mustacheTag(tag: MustacheTag, willRenderValue value: MustacheValue) -> MustacheValue {
                return MustacheValue("delegate")
            }
            func mustacheTag(tag: MustacheTag, didRender rendering: String?, forValue: MustacheValue) {
            }
        }
        var configuration = MustacheConfiguration()
        configuration.extendBaseContextWithTagObserver(TestedTagObserver())
        let repository = MustacheTemplateRepository()
        repository.configuration = configuration
        let template = repository.template(string: "{{name}}")!
        let rendering = template.render(MustacheValue())!
        XCTAssertEqual(rendering, "delegate")
    }
}