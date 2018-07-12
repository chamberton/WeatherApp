// MARK: - Mocks generated from file: Weather/Core/Caching/Cache.swift at 2018-07-12 14:41:22 +0000

//
//  Cache.swift
//  Weather
//
//  Created by Serge Mbamba on 2018/07/07.
//  Copyright © 2018 Momentum. All rights reserved.
//

import Cuckoo
@testable import Weather

import UIKit

class MockCache: Cache, Cuckoo.ProtocolMock {
    typealias MocksType = Cache
    typealias Stubbing = __StubbingProxy_Cache
    typealias Verification = __VerificationProxy_Cache
    let cuckoo_manager = Cuckoo.MockManager(hasParent: false)

    
    // ["name": "isValid", "stubType": "ProtocolToBeStubbedReadOnlyProperty", "@type": "InstanceVariable", "type": "Bool", "isReadOnly": true, "accessibility": ""]
     var isValid: Bool {
        get {
            
            return cuckoo_manager.getter("isValid", superclassCall: Cuckoo.MockManager.crashOnProtocolSuperclassCall())
            
        }
        
    }
    

    

    
    // ["name": "invalidate", "returnSignature": "", "fullyQualifiedName": "invalidate()", "parameterSignature": "", "parameterSignatureWithoutNames": "", "inputTypes": "", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "", "call": "", "parameters": [], "returnType": "Void", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
     func invalidate()  {
        
            return cuckoo_manager.call("invalidate()",
                parameters: (),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    
    // ["name": "clear", "returnSignature": "", "fullyQualifiedName": "clear()", "parameterSignature": "", "parameterSignatureWithoutNames": "", "inputTypes": "", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "", "call": "", "parameters": [], "returnType": "Void", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
     func clear()  {
        
            return cuckoo_manager.call("clear()",
                parameters: (),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    
    // ["name": "update", "returnSignature": "", "fullyQualifiedName": "update(fetchedObject: Any, timeToLive: TimeInterval)", "parameterSignature": "fetchedObject: Any, timeToLive: TimeInterval", "parameterSignatureWithoutNames": "fetchedObject: Any, timeToLive: TimeInterval", "inputTypes": "Any, TimeInterval", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "fetchedObject, timeToLive", "call": "fetchedObject: fetchedObject, timeToLive: timeToLive", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("fetchedObject"), name: "fetchedObject", type: "Any", range: CountableRange(250..<268), nameRange: CountableRange(250..<263)), CuckooGeneratorFramework.MethodParameter(label: Optional("timeToLive"), name: "timeToLive", type: "TimeInterval", range: CountableRange(270..<294), nameRange: CountableRange(270..<280))], "returnType": "Void", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
     func update(fetchedObject: Any, timeToLive: TimeInterval)  {
        
            return cuckoo_manager.call("update(fetchedObject: Any, timeToLive: TimeInterval)",
                parameters: (fetchedObject, timeToLive),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    

	struct __StubbingProxy_Cache: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    var isValid: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockCache, Bool> {
	        return .init(manager: cuckoo_manager, name: "isValid")
	    }
	    
	    
	    func invalidate() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockCache.self, method: "invalidate()", parameterMatchers: matchers))
	    }
	    
	    func clear() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockCache.self, method: "clear()", parameterMatchers: matchers))
	    }
	    
	    func update<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(fetchedObject: M1, timeToLive: M2) -> Cuckoo.ProtocolStubNoReturnFunction<(Any, TimeInterval)> where M1.MatchedType == Any, M2.MatchedType == TimeInterval {
	        let matchers: [Cuckoo.ParameterMatcher<(Any, TimeInterval)>] = [wrap(matchable: fetchedObject) { $0.0 }, wrap(matchable: timeToLive) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockCache.self, method: "update(fetchedObject: Any, timeToLive: TimeInterval)", parameterMatchers: matchers))
	    }
	    
	}

	struct __VerificationProxy_Cache: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    var isValid: Cuckoo.VerifyReadOnlyProperty<Bool> {
	        return .init(manager: cuckoo_manager, name: "isValid", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	    @discardableResult
	    func invalidate() -> Cuckoo.__DoNotUse<Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("invalidate()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func clear() -> Cuckoo.__DoNotUse<Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("clear()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func update<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(fetchedObject: M1, timeToLive: M2) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == Any, M2.MatchedType == TimeInterval {
	        let matchers: [Cuckoo.ParameterMatcher<(Any, TimeInterval)>] = [wrap(matchable: fetchedObject) { $0.0 }, wrap(matchable: timeToLive) { $0.1 }]
	        return cuckoo_manager.verify("update(fetchedObject: Any, timeToLive: TimeInterval)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class CacheStub: Cache {
    
     var isValid: Bool {
        get {
            return DefaultValueRegistry.defaultValue(for: (Bool).self)
        }
        
    }
    

    

    
     func invalidate()  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func clear()  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func update(fetchedObject: Any, timeToLive: TimeInterval)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}


// MARK: - Mocks generated from file: Weather/Core/HTTP Layer/EndpointsInteractor.swift at 2018-07-12 14:41:22 +0000

//
//  EndpointsInteractor.swift
//  Weather
//
//  Created by Serge Mbamba on 2018/07/07.
//  Copyright © 2018 Momentum. All rights reserved.
//

import Cuckoo
@testable import Weather

import UIKit

class MockEndpointsInteractor: EndpointsInteractor, Cuckoo.ClassMock {
    typealias MocksType = EndpointsInteractor
    typealias Stubbing = __StubbingProxy_EndpointsInteractor
    typealias Verification = __VerificationProxy_EndpointsInteractor
    let cuckoo_manager = Cuckoo.MockManager(hasParent: true)

    
    // ["name": "weatherAPIHostURL", "stubType": "ClassToBeStubbedReadOnlyProperty", "@type": "InstanceVariable", "type": "String!", "isReadOnly": true, "accessibility": ""]
     override var weatherAPIHostURL: String! {
        get {
            
            return cuckoo_manager.getter("weatherAPIHostURL", superclassCall: super.weatherAPIHostURL)
            
        }
        
    }
    

    

    

	struct __StubbingProxy_EndpointsInteractor: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    var weatherAPIHostURL: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockEndpointsInteractor, String?> {
	        return .init(manager: cuckoo_manager, name: "weatherAPIHostURL")
	    }
	    
	    
	}

	struct __VerificationProxy_EndpointsInteractor: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    var weatherAPIHostURL: Cuckoo.VerifyReadOnlyProperty<String?> {
	        return .init(manager: cuckoo_manager, name: "weatherAPIHostURL", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	}

}

 class EndpointsInteractorStub: EndpointsInteractor {
    
     override var weatherAPIHostURL: String! {
        get {
            return DefaultValueRegistry.defaultValue(for: (String!).self)
        }
        
    }
    

    

    
}


// MARK: - Mocks generated from file: Weather/Core/HTTP Layer/HeaderInjector.swift at 2018-07-12 14:41:22 +0000

//
//  HeaderInjector.swift
//  Weather
//
//  Created by Serge Mbamba on 2018/07/07.
//  Copyright © 2018 Momentum. All rights reserved.
//

import Cuckoo
@testable import Weather

import UIKit

class MockHeaderInjector: HeaderInjector, Cuckoo.ClassMock {
    typealias MocksType = HeaderInjector
    typealias Stubbing = __StubbingProxy_HeaderInjector
    typealias Verification = __VerificationProxy_HeaderInjector
    let cuckoo_manager = Cuckoo.MockManager(hasParent: true)

    
    // ["name": "weatherApiKey", "stubType": "ClassToBeStubbedReadOnlyProperty", "@type": "InstanceVariable", "type": "String", "isReadOnly": true, "accessibility": ""]
     override var weatherApiKey: String {
        get {
            
            return cuckoo_manager.getter("weatherApiKey", superclassCall: super.weatherApiKey)
            
        }
        
    }
    

    

    
    // ["name": "updateAPIKey", "returnSignature": " -> Bool", "fullyQualifiedName": "updateAPIKey() -> Bool", "parameterSignature": "", "parameterSignatureWithoutNames": "", "inputTypes": "", "isThrowing": false, "isInit": false, "isOverriding": true, "hasClosureParams": false, "@type": "ClassMethod", "accessibility": "", "parameterNames": "", "call": "", "parameters": [], "returnType": "Bool", "isOptional": false, "stubFunction": "Cuckoo.ClassStubFunction"]
     override func updateAPIKey()  -> Bool {
        
            return cuckoo_manager.call("updateAPIKey() -> Bool",
                parameters: (),
                superclassCall:
                    
                    super.updateAPIKey()
                    )
        
    }
    

	struct __StubbingProxy_HeaderInjector: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    var weatherApiKey: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockHeaderInjector, String> {
	        return .init(manager: cuckoo_manager, name: "weatherApiKey")
	    }
	    
	    
	    func updateAPIKey() -> Cuckoo.ClassStubFunction<(), Bool> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockHeaderInjector.self, method: "updateAPIKey() -> Bool", parameterMatchers: matchers))
	    }
	    
	}

	struct __VerificationProxy_HeaderInjector: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    var weatherApiKey: Cuckoo.VerifyReadOnlyProperty<String> {
	        return .init(manager: cuckoo_manager, name: "weatherApiKey", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	    @discardableResult
	    func updateAPIKey() -> Cuckoo.__DoNotUse<Bool> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("updateAPIKey() -> Bool", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class HeaderInjectorStub: HeaderInjector {
    
     override var weatherApiKey: String {
        get {
            return DefaultValueRegistry.defaultValue(for: (String).self)
        }
        
    }
    

    

    
     override func updateAPIKey()  -> Bool {
        return DefaultValueRegistry.defaultValue(for: Bool.self)
    }
    
}


// MARK: - Mocks generated from file: Weather/Core/HTTP Layer/Protocols/SynchronousHTTPGetClient.swift at 2018-07-12 14:41:22 +0000

//
//  SynchronousHTTPGetClient.swift
//  Weather
//
//  Created by Serge Mbamba on 2018/07/07.
//  Copyright © 2018 Momentum. All rights reserved.
//

import Cuckoo
@testable import Weather

import Foundation
import Result

class MockSynchronousHTTPGetClient: SynchronousHTTPGetClient, Cuckoo.ProtocolMock {
    typealias MocksType = SynchronousHTTPGetClient
    typealias Stubbing = __StubbingProxy_SynchronousHTTPGetClient
    typealias Verification = __VerificationProxy_SynchronousHTTPGetClient
    let cuckoo_manager = Cuckoo.MockManager(hasParent: false)

    

    

    
    // ["name": "get", "returnSignature": " -> Result<Data, HTTPError>", "fullyQualifiedName": "get(from: String, paremeters: HTTPDictionary?, headers: HTTPDictionary) -> Result<Data, HTTPError>", "parameterSignature": "from urlString: String, paremeters: HTTPDictionary?, headers: HTTPDictionary", "parameterSignatureWithoutNames": "urlString: String, paremeters: HTTPDictionary?, headers: HTTPDictionary", "inputTypes": "String, HTTPDictionary?, HTTPDictionary", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "urlString, paremeters, headers", "call": "from: urlString, paremeters: paremeters, headers: headers", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("from"), name: "urlString", type: "String", range: CountableRange(235..<257), nameRange: CountableRange(235..<239)), CuckooGeneratorFramework.MethodParameter(label: Optional("paremeters"), name: "paremeters", type: "HTTPDictionary?", range: CountableRange(259..<286), nameRange: CountableRange(259..<269)), CuckooGeneratorFramework.MethodParameter(label: Optional("headers"), name: "headers", type: "HTTPDictionary", range: CountableRange(288..<311), nameRange: CountableRange(288..<295))], "returnType": "Result<Data, HTTPError>", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubFunction"]
     func get(from urlString: String, paremeters: HTTPDictionary?, headers: HTTPDictionary)  -> Result<Data, HTTPError> {
        
            return cuckoo_manager.call("get(from: String, paremeters: HTTPDictionary?, headers: HTTPDictionary) -> Result<Data, HTTPError>",
                parameters: (urlString, paremeters, headers),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    

	struct __StubbingProxy_SynchronousHTTPGetClient: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func get<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(from urlString: M1, paremeters: M2, headers: M3) -> Cuckoo.ProtocolStubFunction<(String, HTTPDictionary?, HTTPDictionary), Result<Data, HTTPError>> where M1.MatchedType == String, M2.MatchedType == HTTPDictionary?, M3.MatchedType == HTTPDictionary {
	        let matchers: [Cuckoo.ParameterMatcher<(String, HTTPDictionary?, HTTPDictionary)>] = [wrap(matchable: urlString) { $0.0 }, wrap(matchable: paremeters) { $0.1 }, wrap(matchable: headers) { $0.2 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockSynchronousHTTPGetClient.self, method: "get(from: String, paremeters: HTTPDictionary?, headers: HTTPDictionary) -> Result<Data, HTTPError>", parameterMatchers: matchers))
	    }
	    
	}

	struct __VerificationProxy_SynchronousHTTPGetClient: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func get<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(from urlString: M1, paremeters: M2, headers: M3) -> Cuckoo.__DoNotUse<Result<Data, HTTPError>> where M1.MatchedType == String, M2.MatchedType == HTTPDictionary?, M3.MatchedType == HTTPDictionary {
	        let matchers: [Cuckoo.ParameterMatcher<(String, HTTPDictionary?, HTTPDictionary)>] = [wrap(matchable: urlString) { $0.0 }, wrap(matchable: paremeters) { $0.1 }, wrap(matchable: headers) { $0.2 }]
	        return cuckoo_manager.verify("get(from: String, paremeters: HTTPDictionary?, headers: HTTPDictionary) -> Result<Data, HTTPError>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class SynchronousHTTPGetClientStub: SynchronousHTTPGetClient {
    

    

    
     func get(from urlString: String, paremeters: HTTPDictionary?, headers: HTTPDictionary)  -> Result<Data, HTTPError> {
        return DefaultValueRegistry.defaultValue(for: Result<Data, HTTPError>.self)
    }
    
}


// MARK: - Mocks generated from file: Weather/Core/HTTP Layer/URLSessionProvider.swift at 2018-07-12 14:41:22 +0000

//
//  URLSessionProviderImplementation.swift
//  Weather
//
//  Created by Serge Mbamba on 2018/07/07.
//  Copyright © 2018 Momentum. All rights reserved.
//

import Cuckoo
@testable import Weather

import UIKit

class MockURLSessionProvider: URLSessionProvider, Cuckoo.ClassMock {
    typealias MocksType = URLSessionProvider
    typealias Stubbing = __StubbingProxy_URLSessionProvider
    typealias Verification = __VerificationProxy_URLSessionProvider
    let cuckoo_manager = Cuckoo.MockManager(hasParent: true)

    
    // ["name": "shared", "stubType": "ClassToBeStubbedReadOnlyProperty", "@type": "InstanceVariable", "type": "URLSession", "isReadOnly": true, "accessibility": ""]
     override var shared: URLSession {
        get {
            
            return cuckoo_manager.getter("shared", superclassCall: super.shared)
            
        }
        
    }
    

    

    

	struct __StubbingProxy_URLSessionProvider: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    var shared: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockURLSessionProvider, URLSession> {
	        return .init(manager: cuckoo_manager, name: "shared")
	    }
	    
	    
	}

	struct __VerificationProxy_URLSessionProvider: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    var shared: Cuckoo.VerifyReadOnlyProperty<URLSession> {
	        return .init(manager: cuckoo_manager, name: "shared", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	}

}

 class URLSessionProviderStub: URLSessionProvider {
    
     override var shared: URLSession {
        get {
            return DefaultValueRegistry.defaultValue(for: (URLSession).self)
        }
        
    }
    

    

    
}


// MARK: - Mocks generated from file: Weather/Core/Location Manager/LocationInterator.swift at 2018-07-12 14:41:22 +0000

//
//  LocationInterator.swift
//  Weather
//
//  Created by Serge Mbamba on 2018/07/12.
//  Copyright © 2018 Momentum. All rights reserved.
//

import Cuckoo
@testable import Weather

import CoreLocation
import UIKit

class MockLocationInterator: LocationInterator, Cuckoo.ClassMock {
    typealias MocksType = LocationInterator
    typealias Stubbing = __StubbingProxy_LocationInterator
    typealias Verification = __VerificationProxy_LocationInterator
    let cuckoo_manager = Cuckoo.MockManager(hasParent: true)

    
    // ["name": "currentLocation", "stubType": "ClassToBeStubbedReadOnlyProperty", "@type": "InstanceVariable", "type": "CLLocation?", "isReadOnly": true, "accessibility": ""]
     override var currentLocation: CLLocation? {
        get {
            
            return cuckoo_manager.getter("currentLocation", superclassCall: super.currentLocation)
            
        }
        
    }
    
    // ["name": "delegate", "stubType": "ClassToBeStubbedProperty", "@type": "InstanceVariable", "type": "LocationInteractorDelegate?", "isReadOnly": false, "accessibility": "public"]
    public override var delegate: LocationInteractorDelegate? {
        get {
            
            return cuckoo_manager.getter("delegate", superclassCall: super.delegate)
            
        }
        
        set {
            
            cuckoo_manager.setter("delegate", value: newValue, superclassCall: super.delegate = newValue)
            
        }
        
    }
    

    

    
    // ["name": "requestLocationAuthorizationIfNeeded", "returnSignature": "", "fullyQualifiedName": "requestLocationAuthorizationIfNeeded()", "parameterSignature": "", "parameterSignatureWithoutNames": "", "inputTypes": "", "isThrowing": false, "isInit": false, "isOverriding": true, "hasClosureParams": false, "@type": "ClassMethod", "accessibility": "public", "parameterNames": "", "call": "", "parameters": [], "returnType": "Void", "isOptional": false, "stubFunction": "Cuckoo.ClassStubNoReturnFunction"]
    public override func requestLocationAuthorizationIfNeeded()  {
        
            return cuckoo_manager.call("requestLocationAuthorizationIfNeeded()",
                parameters: (),
                superclassCall:
                    
                    super.requestLocationAuthorizationIfNeeded()
                    )
        
    }
    
    // ["name": "startManagingLocation", "returnSignature": "", "fullyQualifiedName": "startManagingLocation()", "parameterSignature": "", "parameterSignatureWithoutNames": "", "inputTypes": "", "isThrowing": false, "isInit": false, "isOverriding": true, "hasClosureParams": false, "@type": "ClassMethod", "accessibility": "", "parameterNames": "", "call": "", "parameters": [], "returnType": "Void", "isOptional": false, "stubFunction": "Cuckoo.ClassStubNoReturnFunction"]
     override func startManagingLocation()  {
        
            return cuckoo_manager.call("startManagingLocation()",
                parameters: (),
                superclassCall:
                    
                    super.startManagingLocation()
                    )
        
    }
    
    // ["name": "stopManagingLocation", "returnSignature": "", "fullyQualifiedName": "stopManagingLocation()", "parameterSignature": "", "parameterSignatureWithoutNames": "", "inputTypes": "", "isThrowing": false, "isInit": false, "isOverriding": true, "hasClosureParams": false, "@type": "ClassMethod", "accessibility": "public", "parameterNames": "", "call": "", "parameters": [], "returnType": "Void", "isOptional": false, "stubFunction": "Cuckoo.ClassStubNoReturnFunction"]
    public override func stopManagingLocation()  {
        
            return cuckoo_manager.call("stopManagingLocation()",
                parameters: (),
                superclassCall:
                    
                    super.stopManagingLocation()
                    )
        
    }
    

	struct __StubbingProxy_LocationInterator: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    var currentLocation: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockLocationInterator, CLLocation?> {
	        return .init(manager: cuckoo_manager, name: "currentLocation")
	    }
	    
	    var delegate: Cuckoo.ClassToBeStubbedProperty<MockLocationInterator, LocationInteractorDelegate?> {
	        return .init(manager: cuckoo_manager, name: "delegate")
	    }
	    
	    
	    func requestLocationAuthorizationIfNeeded() -> Cuckoo.ClassStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockLocationInterator.self, method: "requestLocationAuthorizationIfNeeded()", parameterMatchers: matchers))
	    }
	    
	    func startManagingLocation() -> Cuckoo.ClassStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockLocationInterator.self, method: "startManagingLocation()", parameterMatchers: matchers))
	    }
	    
	    func stopManagingLocation() -> Cuckoo.ClassStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockLocationInterator.self, method: "stopManagingLocation()", parameterMatchers: matchers))
	    }
	    
	}

	struct __VerificationProxy_LocationInterator: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    var currentLocation: Cuckoo.VerifyReadOnlyProperty<CLLocation?> {
	        return .init(manager: cuckoo_manager, name: "currentLocation", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    var delegate: Cuckoo.VerifyProperty<LocationInteractorDelegate?> {
	        return .init(manager: cuckoo_manager, name: "delegate", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	    @discardableResult
	    func requestLocationAuthorizationIfNeeded() -> Cuckoo.__DoNotUse<Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("requestLocationAuthorizationIfNeeded()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func startManagingLocation() -> Cuckoo.__DoNotUse<Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("startManagingLocation()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func stopManagingLocation() -> Cuckoo.__DoNotUse<Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("stopManagingLocation()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class LocationInteratorStub: LocationInterator {
    
     override var currentLocation: CLLocation? {
        get {
            return DefaultValueRegistry.defaultValue(for: (CLLocation?).self)
        }
        
    }
    
    public override var delegate: LocationInteractorDelegate? {
        get {
            return DefaultValueRegistry.defaultValue(for: (LocationInteractorDelegate?).self)
        }
        
        set { }
        
    }
    

    

    
    public override func requestLocationAuthorizationIfNeeded()  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     override func startManagingLocation()  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
    public override func stopManagingLocation()  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}


// MARK: - Mocks generated from file: Weather/Core/URLInteractor.swift at 2018-07-12 14:41:22 +0000


//
//  URLInteractor.swift
//  Weather
//
//  Created by Serge Mbamba on 2018/07/07.
//  Copyright © 2018 Momentum. All rights reserved.
//

import Cuckoo
@testable import Weather

import UIKit

class MockURLInteractor: URLInteractor, Cuckoo.ClassMock {
    typealias MocksType = URLInteractor
    typealias Stubbing = __StubbingProxy_URLInteractor
    typealias Verification = __VerificationProxy_URLInteractor
    let cuckoo_manager = Cuckoo.MockManager(hasParent: true)

    

    

    
    // ["name": "urlPathWith", "returnSignature": " -> String", "fullyQualifiedName": "urlPathWith(absolute: String, relative: String) -> String", "parameterSignature": "absolute: String, relative: String", "parameterSignatureWithoutNames": "absolute: String, relative: String", "inputTypes": "String, String", "isThrowing": false, "isInit": false, "isOverriding": true, "hasClosureParams": false, "@type": "ClassMethod", "accessibility": "public", "parameterNames": "absolute, relative", "call": "absolute: absolute, relative: relative", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("absolute"), name: "absolute", type: "String", range: CountableRange(207..<223), nameRange: CountableRange(207..<215)), CuckooGeneratorFramework.MethodParameter(label: Optional("relative"), name: "relative", type: "String", range: CountableRange(225..<241), nameRange: CountableRange(225..<233))], "returnType": "String", "isOptional": false, "stubFunction": "Cuckoo.ClassStubFunction"]
    public override func urlPathWith(absolute: String, relative: String)  -> String {
        
            return cuckoo_manager.call("urlPathWith(absolute: String, relative: String) -> String",
                parameters: (absolute, relative),
                superclassCall:
                    
                    super.urlPathWith(absolute: absolute, relative: relative)
                    )
        
    }
    
    // ["name": "urlWith", "returnSignature": " -> URL?", "fullyQualifiedName": "urlWith(_: String) -> URL?", "parameterSignature": "_ urlPath: String", "parameterSignatureWithoutNames": "urlPath: String", "inputTypes": "String", "isThrowing": false, "isInit": false, "isOverriding": true, "hasClosureParams": false, "@type": "ClassMethod", "accessibility": "public", "parameterNames": "urlPath", "call": "urlPath", "parameters": [CuckooGeneratorFramework.MethodParameter(label: nil, name: "urlPath", type: "String", range: CountableRange(569..<586), nameRange: CountableRange(0..<0))], "returnType": "Optional<URL>", "isOptional": false, "stubFunction": "Cuckoo.ClassStubFunction"]
    public override func urlWith(_ urlPath: String)  -> URL? {
        
            return cuckoo_manager.call("urlWith(_: String) -> URL?",
                parameters: (urlPath),
                superclassCall:
                    
                    super.urlWith(urlPath)
                    )
        
    }
    

	struct __StubbingProxy_URLInteractor: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func urlPathWith<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(absolute: M1, relative: M2) -> Cuckoo.ClassStubFunction<(String, String), String> where M1.MatchedType == String, M2.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String, String)>] = [wrap(matchable: absolute) { $0.0 }, wrap(matchable: relative) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockURLInteractor.self, method: "urlPathWith(absolute: String, relative: String) -> String", parameterMatchers: matchers))
	    }
	    
	    func urlWith<M1: Cuckoo.Matchable>(_ urlPath: M1) -> Cuckoo.ClassStubFunction<(String), Optional<URL>> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: urlPath) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockURLInteractor.self, method: "urlWith(_: String) -> URL?", parameterMatchers: matchers))
	    }
	    
	}

	struct __VerificationProxy_URLInteractor: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func urlPathWith<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(absolute: M1, relative: M2) -> Cuckoo.__DoNotUse<String> where M1.MatchedType == String, M2.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String, String)>] = [wrap(matchable: absolute) { $0.0 }, wrap(matchable: relative) { $0.1 }]
	        return cuckoo_manager.verify("urlPathWith(absolute: String, relative: String) -> String", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func urlWith<M1: Cuckoo.Matchable>(_ urlPath: M1) -> Cuckoo.__DoNotUse<Optional<URL>> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: urlPath) { $0 }]
	        return cuckoo_manager.verify("urlWith(_: String) -> URL?", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class URLInteractorStub: URLInteractor {
    

    

    
    public override func urlPathWith(absolute: String, relative: String)  -> String {
        return DefaultValueRegistry.defaultValue(for: String.self)
    }
    
    public override func urlWith(_ urlPath: String)  -> URL? {
        return DefaultValueRegistry.defaultValue(for: Optional<URL>.self)
    }
    
}


// MARK: - Mocks generated from file: Weather/ForeCast/Service Layer/Cache/FiveDaysForecastCache.swift at 2018-07-12 14:41:22 +0000


//
//  FiveDaysForecastCache.swift
//  Weather
//
//  Created by Serge Mbamba on 2018/07/09.
//  Copyright © 2018 Momentum. All rights reserved.
//

import Cuckoo
@testable import Weather

import CoreLocation
import UIKit

class MockFiveDaysForecastCache: FiveDaysForecastCache, Cuckoo.ProtocolMock {
    typealias MocksType = FiveDaysForecastCache
    typealias Stubbing = __StubbingProxy_FiveDaysForecastCache
    typealias Verification = __VerificationProxy_FiveDaysForecastCache
    let cuckoo_manager = Cuckoo.MockManager(hasParent: false)

    
    // ["name": "isValid", "stubType": "ProtocolToBeStubbedReadOnlyProperty", "@type": "InstanceVariable", "type": "Bool", "isReadOnly": true, "accessibility": ""]
     var isValid: Bool {
        get {
            
            return cuckoo_manager.getter("isValid", superclassCall: Cuckoo.MockManager.crashOnProtocolSuperclassCall())
            
        }
        
    }
    

    

    
    // ["name": "nextFiveDaysWeatherForecast", "returnSignature": " -> [WeatherInformationByDate]", "fullyQualifiedName": "nextFiveDaysWeatherForecast(for: CLLocation) -> [WeatherInformationByDate]", "parameterSignature": "for location: CLLocation", "parameterSignatureWithoutNames": "location: CLLocation", "inputTypes": "CLLocation", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "location", "call": "for: location", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("for"), name: "location", type: "CLLocation", range: CountableRange(262..<286), nameRange: CountableRange(262..<265))], "returnType": "[WeatherInformationByDate]", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubFunction"]
     func nextFiveDaysWeatherForecast(for location: CLLocation)  -> [WeatherInformationByDate] {
        
            return cuckoo_manager.call("nextFiveDaysWeatherForecast(for: CLLocation) -> [WeatherInformationByDate]",
                parameters: (location),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    
    // ["name": "invalidate", "returnSignature": "", "fullyQualifiedName": "invalidate()", "parameterSignature": "", "parameterSignatureWithoutNames": "", "inputTypes": "", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "", "call": "", "parameters": [], "returnType": "Void", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
     func invalidate()  {
        
            return cuckoo_manager.call("invalidate()",
                parameters: (),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    
    // ["name": "clear", "returnSignature": "", "fullyQualifiedName": "clear()", "parameterSignature": "", "parameterSignatureWithoutNames": "", "inputTypes": "", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "", "call": "", "parameters": [], "returnType": "Void", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
     func clear()  {
        
            return cuckoo_manager.call("clear()",
                parameters: (),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    
    // ["name": "update", "returnSignature": "", "fullyQualifiedName": "update(fetchedObject: Any, timeToLive: TimeInterval)", "parameterSignature": "fetchedObject: Any, timeToLive: TimeInterval", "parameterSignatureWithoutNames": "fetchedObject: Any, timeToLive: TimeInterval", "inputTypes": "Any, TimeInterval", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "fetchedObject, timeToLive", "call": "fetchedObject: fetchedObject, timeToLive: timeToLive", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("fetchedObject"), name: "fetchedObject", type: "Any", range: CountableRange(250..<268), nameRange: CountableRange(250..<263)), CuckooGeneratorFramework.MethodParameter(label: Optional("timeToLive"), name: "timeToLive", type: "TimeInterval", range: CountableRange(270..<294), nameRange: CountableRange(270..<280))], "returnType": "Void", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
     func update(fetchedObject: Any, timeToLive: TimeInterval)  {
        
            return cuckoo_manager.call("update(fetchedObject: Any, timeToLive: TimeInterval)",
                parameters: (fetchedObject, timeToLive),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    

	struct __StubbingProxy_FiveDaysForecastCache: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    var isValid: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockFiveDaysForecastCache, Bool> {
	        return .init(manager: cuckoo_manager, name: "isValid")
	    }
	    
	    
	    func nextFiveDaysWeatherForecast<M1: Cuckoo.Matchable>(for location: M1) -> Cuckoo.ProtocolStubFunction<(CLLocation), [WeatherInformationByDate]> where M1.MatchedType == CLLocation {
	        let matchers: [Cuckoo.ParameterMatcher<(CLLocation)>] = [wrap(matchable: location) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockFiveDaysForecastCache.self, method: "nextFiveDaysWeatherForecast(for: CLLocation) -> [WeatherInformationByDate]", parameterMatchers: matchers))
	    }
	    
	    func invalidate() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockFiveDaysForecastCache.self, method: "invalidate()", parameterMatchers: matchers))
	    }
	    
	    func clear() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockFiveDaysForecastCache.self, method: "clear()", parameterMatchers: matchers))
	    }
	    
	    func update<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(fetchedObject: M1, timeToLive: M2) -> Cuckoo.ProtocolStubNoReturnFunction<(Any, TimeInterval)> where M1.MatchedType == Any, M2.MatchedType == TimeInterval {
	        let matchers: [Cuckoo.ParameterMatcher<(Any, TimeInterval)>] = [wrap(matchable: fetchedObject) { $0.0 }, wrap(matchable: timeToLive) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockFiveDaysForecastCache.self, method: "update(fetchedObject: Any, timeToLive: TimeInterval)", parameterMatchers: matchers))
	    }
	    
	}

	struct __VerificationProxy_FiveDaysForecastCache: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    var isValid: Cuckoo.VerifyReadOnlyProperty<Bool> {
	        return .init(manager: cuckoo_manager, name: "isValid", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	    @discardableResult
	    func nextFiveDaysWeatherForecast<M1: Cuckoo.Matchable>(for location: M1) -> Cuckoo.__DoNotUse<[WeatherInformationByDate]> where M1.MatchedType == CLLocation {
	        let matchers: [Cuckoo.ParameterMatcher<(CLLocation)>] = [wrap(matchable: location) { $0 }]
	        return cuckoo_manager.verify("nextFiveDaysWeatherForecast(for: CLLocation) -> [WeatherInformationByDate]", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func invalidate() -> Cuckoo.__DoNotUse<Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("invalidate()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func clear() -> Cuckoo.__DoNotUse<Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("clear()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func update<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(fetchedObject: M1, timeToLive: M2) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == Any, M2.MatchedType == TimeInterval {
	        let matchers: [Cuckoo.ParameterMatcher<(Any, TimeInterval)>] = [wrap(matchable: fetchedObject) { $0.0 }, wrap(matchable: timeToLive) { $0.1 }]
	        return cuckoo_manager.verify("update(fetchedObject: Any, timeToLive: TimeInterval)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class FiveDaysForecastCacheStub: FiveDaysForecastCache {
    
     var isValid: Bool {
        get {
            return DefaultValueRegistry.defaultValue(for: (Bool).self)
        }
        
    }
    

    

    
     func nextFiveDaysWeatherForecast(for location: CLLocation)  -> [WeatherInformationByDate] {
        return DefaultValueRegistry.defaultValue(for: [WeatherInformationByDate].self)
    }
    
     func invalidate()  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func clear()  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func update(fetchedObject: Any, timeToLive: TimeInterval)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}


// MARK: - Mocks generated from file: Weather/ForeCast/Service Layer/Cache/WeatherForecastCache.swift at 2018-07-12 14:41:22 +0000

//
//  WeatherForecastCache.swift
//  Weather
//
//  Created by Serge Mbamba on 2018/07/07.
//  Copyright © 2018 Momentum. All rights reserved.
//

import Cuckoo
@testable import Weather

import CoreLocation
import UIKit

class MockWeatherForecastCache: WeatherForecastCache, Cuckoo.ProtocolMock {
    typealias MocksType = WeatherForecastCache
    typealias Stubbing = __StubbingProxy_WeatherForecastCache
    typealias Verification = __VerificationProxy_WeatherForecastCache
    let cuckoo_manager = Cuckoo.MockManager(hasParent: false)

    
    // ["name": "isValid", "stubType": "ProtocolToBeStubbedReadOnlyProperty", "@type": "InstanceVariable", "type": "Bool", "isReadOnly": true, "accessibility": ""]
     var isValid: Bool {
        get {
            
            return cuckoo_manager.getter("isValid", superclassCall: Cuckoo.MockManager.crashOnProtocolSuperclassCall())
            
        }
        
    }
    

    

    
    // ["name": "currentWeatherInformation", "returnSignature": " -> CurrentWeatherInformation?", "fullyQualifiedName": "currentWeatherInformation(for: CLLocation) -> CurrentWeatherInformation?", "parameterSignature": "for location: CLLocation", "parameterSignatureWithoutNames": "location: CLLocation", "inputTypes": "CLLocation", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "location", "call": "for: location", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("for"), name: "location", type: "CLLocation", range: CountableRange(257..<281), nameRange: CountableRange(257..<260))], "returnType": "Optional<CurrentWeatherInformation>", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubFunction"]
     func currentWeatherInformation(for location: CLLocation)  -> CurrentWeatherInformation? {
        
            return cuckoo_manager.call("currentWeatherInformation(for: CLLocation) -> CurrentWeatherInformation?",
                parameters: (location),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    
    // ["name": "invalidate", "returnSignature": "", "fullyQualifiedName": "invalidate()", "parameterSignature": "", "parameterSignatureWithoutNames": "", "inputTypes": "", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "", "call": "", "parameters": [], "returnType": "Void", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
     func invalidate()  {
        
            return cuckoo_manager.call("invalidate()",
                parameters: (),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    
    // ["name": "clear", "returnSignature": "", "fullyQualifiedName": "clear()", "parameterSignature": "", "parameterSignatureWithoutNames": "", "inputTypes": "", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "", "call": "", "parameters": [], "returnType": "Void", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
     func clear()  {
        
            return cuckoo_manager.call("clear()",
                parameters: (),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    
    // ["name": "update", "returnSignature": "", "fullyQualifiedName": "update(fetchedObject: Any, timeToLive: TimeInterval)", "parameterSignature": "fetchedObject: Any, timeToLive: TimeInterval", "parameterSignatureWithoutNames": "fetchedObject: Any, timeToLive: TimeInterval", "inputTypes": "Any, TimeInterval", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "fetchedObject, timeToLive", "call": "fetchedObject: fetchedObject, timeToLive: timeToLive", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("fetchedObject"), name: "fetchedObject", type: "Any", range: CountableRange(250..<268), nameRange: CountableRange(250..<263)), CuckooGeneratorFramework.MethodParameter(label: Optional("timeToLive"), name: "timeToLive", type: "TimeInterval", range: CountableRange(270..<294), nameRange: CountableRange(270..<280))], "returnType": "Void", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
     func update(fetchedObject: Any, timeToLive: TimeInterval)  {
        
            return cuckoo_manager.call("update(fetchedObject: Any, timeToLive: TimeInterval)",
                parameters: (fetchedObject, timeToLive),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    

	struct __StubbingProxy_WeatherForecastCache: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    var isValid: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockWeatherForecastCache, Bool> {
	        return .init(manager: cuckoo_manager, name: "isValid")
	    }
	    
	    
	    func currentWeatherInformation<M1: Cuckoo.Matchable>(for location: M1) -> Cuckoo.ProtocolStubFunction<(CLLocation), Optional<CurrentWeatherInformation>> where M1.MatchedType == CLLocation {
	        let matchers: [Cuckoo.ParameterMatcher<(CLLocation)>] = [wrap(matchable: location) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockWeatherForecastCache.self, method: "currentWeatherInformation(for: CLLocation) -> CurrentWeatherInformation?", parameterMatchers: matchers))
	    }
	    
	    func invalidate() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockWeatherForecastCache.self, method: "invalidate()", parameterMatchers: matchers))
	    }
	    
	    func clear() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockWeatherForecastCache.self, method: "clear()", parameterMatchers: matchers))
	    }
	    
	    func update<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(fetchedObject: M1, timeToLive: M2) -> Cuckoo.ProtocolStubNoReturnFunction<(Any, TimeInterval)> where M1.MatchedType == Any, M2.MatchedType == TimeInterval {
	        let matchers: [Cuckoo.ParameterMatcher<(Any, TimeInterval)>] = [wrap(matchable: fetchedObject) { $0.0 }, wrap(matchable: timeToLive) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockWeatherForecastCache.self, method: "update(fetchedObject: Any, timeToLive: TimeInterval)", parameterMatchers: matchers))
	    }
	    
	}

	struct __VerificationProxy_WeatherForecastCache: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    var isValid: Cuckoo.VerifyReadOnlyProperty<Bool> {
	        return .init(manager: cuckoo_manager, name: "isValid", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	    @discardableResult
	    func currentWeatherInformation<M1: Cuckoo.Matchable>(for location: M1) -> Cuckoo.__DoNotUse<Optional<CurrentWeatherInformation>> where M1.MatchedType == CLLocation {
	        let matchers: [Cuckoo.ParameterMatcher<(CLLocation)>] = [wrap(matchable: location) { $0 }]
	        return cuckoo_manager.verify("currentWeatherInformation(for: CLLocation) -> CurrentWeatherInformation?", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func invalidate() -> Cuckoo.__DoNotUse<Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("invalidate()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func clear() -> Cuckoo.__DoNotUse<Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("clear()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func update<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(fetchedObject: M1, timeToLive: M2) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == Any, M2.MatchedType == TimeInterval {
	        let matchers: [Cuckoo.ParameterMatcher<(Any, TimeInterval)>] = [wrap(matchable: fetchedObject) { $0.0 }, wrap(matchable: timeToLive) { $0.1 }]
	        return cuckoo_manager.verify("update(fetchedObject: Any, timeToLive: TimeInterval)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class WeatherForecastCacheStub: WeatherForecastCache {
    
     var isValid: Bool {
        get {
            return DefaultValueRegistry.defaultValue(for: (Bool).self)
        }
        
    }
    

    

    
     func currentWeatherInformation(for location: CLLocation)  -> CurrentWeatherInformation? {
        return DefaultValueRegistry.defaultValue(for: Optional<CurrentWeatherInformation>.self)
    }
    
     func invalidate()  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func clear()  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func update(fetchedObject: Any, timeToLive: TimeInterval)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}


// MARK: - Mocks generated from file: Weather/ForeCast/Service Layer/WeatherForecastService.swift at 2018-07-12 14:41:22 +0000

//
//  WeatherForecastService.swift
//  Weather
//
//  Created by Serge Mbamba on 2018/07/07.
//  Copyright © 2018 Momentum. All rights reserved.
//

import Cuckoo
@testable import Weather

import Result
import UIKit

class MockWeatherForecastService: WeatherForecastService, Cuckoo.ClassMock {
    typealias MocksType = WeatherForecastService
    typealias Stubbing = __StubbingProxy_WeatherForecastService
    typealias Verification = __VerificationProxy_WeatherForecastService
    let cuckoo_manager = Cuckoo.MockManager(hasParent: true)

    

    

    
    // ["name": "fetchCurrentWeatherInformation", "returnSignature": " -> CurrentWeatherResponse", "fullyQualifiedName": "fetchCurrentWeatherInformation(request: CurrentWeatherRequest) -> CurrentWeatherResponse", "parameterSignature": "request: CurrentWeatherRequest", "parameterSignatureWithoutNames": "request: CurrentWeatherRequest", "inputTypes": "CurrentWeatherRequest", "isThrowing": false, "isInit": false, "isOverriding": true, "hasClosureParams": false, "@type": "ClassMethod", "accessibility": "", "parameterNames": "request", "call": "request: request", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("request"), name: "request", type: "CurrentWeatherRequest", range: CountableRange(692..<722), nameRange: CountableRange(692..<699))], "returnType": "CurrentWeatherResponse", "isOptional": false, "stubFunction": "Cuckoo.ClassStubFunction"]
     override func fetchCurrentWeatherInformation(request: CurrentWeatherRequest)  -> CurrentWeatherResponse {
        
            return cuckoo_manager.call("fetchCurrentWeatherInformation(request: CurrentWeatherRequest) -> CurrentWeatherResponse",
                parameters: (request),
                superclassCall:
                    
                    super.fetchCurrentWeatherInformation(request: request)
                    )
        
    }
    
    // ["name": "fetchFiveDayWeatherForecast", "returnSignature": " -> FiveDayWeatherForecastResponse", "fullyQualifiedName": "fetchFiveDayWeatherForecast(request: FiveDayWeatherForecastRequest) -> FiveDayWeatherForecastResponse", "parameterSignature": "request: FiveDayWeatherForecastRequest", "parameterSignatureWithoutNames": "request: FiveDayWeatherForecastRequest", "inputTypes": "FiveDayWeatherForecastRequest", "isThrowing": false, "isInit": false, "isOverriding": true, "hasClosureParams": false, "@type": "ClassMethod", "accessibility": "", "parameterNames": "request", "call": "request: request", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("request"), name: "request", type: "FiveDayWeatherForecastRequest", range: CountableRange(1414..<1452), nameRange: CountableRange(1414..<1421))], "returnType": "FiveDayWeatherForecastResponse", "isOptional": false, "stubFunction": "Cuckoo.ClassStubFunction"]
     override func fetchFiveDayWeatherForecast(request: FiveDayWeatherForecastRequest)  -> FiveDayWeatherForecastResponse {
        
            return cuckoo_manager.call("fetchFiveDayWeatherForecast(request: FiveDayWeatherForecastRequest) -> FiveDayWeatherForecastResponse",
                parameters: (request),
                superclassCall:
                    
                    super.fetchFiveDayWeatherForecast(request: request)
                    )
        
    }
    

	struct __StubbingProxy_WeatherForecastService: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func fetchCurrentWeatherInformation<M1: Cuckoo.Matchable>(request: M1) -> Cuckoo.ClassStubFunction<(CurrentWeatherRequest), CurrentWeatherResponse> where M1.MatchedType == CurrentWeatherRequest {
	        let matchers: [Cuckoo.ParameterMatcher<(CurrentWeatherRequest)>] = [wrap(matchable: request) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockWeatherForecastService.self, method: "fetchCurrentWeatherInformation(request: CurrentWeatherRequest) -> CurrentWeatherResponse", parameterMatchers: matchers))
	    }
	    
	    func fetchFiveDayWeatherForecast<M1: Cuckoo.Matchable>(request: M1) -> Cuckoo.ClassStubFunction<(FiveDayWeatherForecastRequest), FiveDayWeatherForecastResponse> where M1.MatchedType == FiveDayWeatherForecastRequest {
	        let matchers: [Cuckoo.ParameterMatcher<(FiveDayWeatherForecastRequest)>] = [wrap(matchable: request) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockWeatherForecastService.self, method: "fetchFiveDayWeatherForecast(request: FiveDayWeatherForecastRequest) -> FiveDayWeatherForecastResponse", parameterMatchers: matchers))
	    }
	    
	}

	struct __VerificationProxy_WeatherForecastService: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func fetchCurrentWeatherInformation<M1: Cuckoo.Matchable>(request: M1) -> Cuckoo.__DoNotUse<CurrentWeatherResponse> where M1.MatchedType == CurrentWeatherRequest {
	        let matchers: [Cuckoo.ParameterMatcher<(CurrentWeatherRequest)>] = [wrap(matchable: request) { $0 }]
	        return cuckoo_manager.verify("fetchCurrentWeatherInformation(request: CurrentWeatherRequest) -> CurrentWeatherResponse", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func fetchFiveDayWeatherForecast<M1: Cuckoo.Matchable>(request: M1) -> Cuckoo.__DoNotUse<FiveDayWeatherForecastResponse> where M1.MatchedType == FiveDayWeatherForecastRequest {
	        let matchers: [Cuckoo.ParameterMatcher<(FiveDayWeatherForecastRequest)>] = [wrap(matchable: request) { $0 }]
	        return cuckoo_manager.verify("fetchFiveDayWeatherForecast(request: FiveDayWeatherForecastRequest) -> FiveDayWeatherForecastResponse", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class WeatherForecastServiceStub: WeatherForecastService {
    

    

    
     override func fetchCurrentWeatherInformation(request: CurrentWeatherRequest)  -> CurrentWeatherResponse {
        return DefaultValueRegistry.defaultValue(for: CurrentWeatherResponse.self)
    }
    
     override func fetchFiveDayWeatherForecast(request: FiveDayWeatherForecastRequest)  -> FiveDayWeatherForecastResponse {
        return DefaultValueRegistry.defaultValue(for: FiveDayWeatherForecastResponse.self)
    }
    
}


// MARK: - Mocks generated from file: Weather/ForeCast/WeatherForecastInteractor.swift at 2018-07-12 14:41:22 +0000

//
//  WeatherForecastInteractor.swift
//  Weather
//
//  Created by Serge Mbamba on 2018/07/07.
//  Copyright © 2018 Momentum. All rights reserved.
//

import Cuckoo
@testable import Weather

import CoreLocation
import UIKit

class MockWeatherForecastInteractor: WeatherForecastInteractor, Cuckoo.ClassMock {
    typealias MocksType = WeatherForecastInteractor
    typealias Stubbing = __StubbingProxy_WeatherForecastInteractor
    typealias Verification = __VerificationProxy_WeatherForecastInteractor
    let cuckoo_manager = Cuckoo.MockManager(hasParent: true)

    

    

    
    // ["name": "currentWeatherInformation", "returnSignature": " throws -> CurrentWeatherInformation", "fullyQualifiedName": "currentWeatherInformation(location: CLLocation) throws -> CurrentWeatherInformation", "parameterSignature": "location: CLLocation", "parameterSignatureWithoutNames": "location: CLLocation", "inputTypes": "CLLocation", "isThrowing": true, "isInit": false, "isOverriding": true, "hasClosureParams": false, "@type": "ClassMethod", "accessibility": "", "parameterNames": "location", "call": "location: location", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("location"), name: "location", type: "CLLocation", range: CountableRange(597..<617), nameRange: CountableRange(597..<605))], "returnType": "CurrentWeatherInformation", "isOptional": false, "stubFunction": "Cuckoo.ClassStubThrowingFunction"]
     override func currentWeatherInformation(location: CLLocation)  throws -> CurrentWeatherInformation {
        
            return try cuckoo_manager.callThrows("currentWeatherInformation(location: CLLocation) throws -> CurrentWeatherInformation",
                parameters: (location),
                superclassCall:
                    
                    super.currentWeatherInformation(location: location)
                    )
        
    }
    
    // ["name": "nextFiveDaysWeatherForecast", "returnSignature": " throws -> [WeatherInformationByDate]", "fullyQualifiedName": "nextFiveDaysWeatherForecast(location: CLLocation) throws -> [WeatherInformationByDate]", "parameterSignature": "location: CLLocation", "parameterSignatureWithoutNames": "location: CLLocation", "inputTypes": "CLLocation", "isThrowing": true, "isInit": false, "isOverriding": true, "hasClosureParams": false, "@type": "ClassMethod", "accessibility": "", "parameterNames": "location", "call": "location: location", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("location"), name: "location", type: "CLLocation", range: CountableRange(1654..<1674), nameRange: CountableRange(1654..<1662))], "returnType": "[WeatherInformationByDate]", "isOptional": false, "stubFunction": "Cuckoo.ClassStubThrowingFunction"]
     override func nextFiveDaysWeatherForecast(location: CLLocation)  throws -> [WeatherInformationByDate] {
        
            return try cuckoo_manager.callThrows("nextFiveDaysWeatherForecast(location: CLLocation) throws -> [WeatherInformationByDate]",
                parameters: (location),
                superclassCall:
                    
                    super.nextFiveDaysWeatherForecast(location: location)
                    )
        
    }
    

	struct __StubbingProxy_WeatherForecastInteractor: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func currentWeatherInformation<M1: Cuckoo.Matchable>(location: M1) -> Cuckoo.ClassStubThrowingFunction<(CLLocation), CurrentWeatherInformation> where M1.MatchedType == CLLocation {
	        let matchers: [Cuckoo.ParameterMatcher<(CLLocation)>] = [wrap(matchable: location) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockWeatherForecastInteractor.self, method: "currentWeatherInformation(location: CLLocation) throws -> CurrentWeatherInformation", parameterMatchers: matchers))
	    }
	    
	    func nextFiveDaysWeatherForecast<M1: Cuckoo.Matchable>(location: M1) -> Cuckoo.ClassStubThrowingFunction<(CLLocation), [WeatherInformationByDate]> where M1.MatchedType == CLLocation {
	        let matchers: [Cuckoo.ParameterMatcher<(CLLocation)>] = [wrap(matchable: location) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockWeatherForecastInteractor.self, method: "nextFiveDaysWeatherForecast(location: CLLocation) throws -> [WeatherInformationByDate]", parameterMatchers: matchers))
	    }
	    
	}

	struct __VerificationProxy_WeatherForecastInteractor: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func currentWeatherInformation<M1: Cuckoo.Matchable>(location: M1) -> Cuckoo.__DoNotUse<CurrentWeatherInformation> where M1.MatchedType == CLLocation {
	        let matchers: [Cuckoo.ParameterMatcher<(CLLocation)>] = [wrap(matchable: location) { $0 }]
	        return cuckoo_manager.verify("currentWeatherInformation(location: CLLocation) throws -> CurrentWeatherInformation", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func nextFiveDaysWeatherForecast<M1: Cuckoo.Matchable>(location: M1) -> Cuckoo.__DoNotUse<[WeatherInformationByDate]> where M1.MatchedType == CLLocation {
	        let matchers: [Cuckoo.ParameterMatcher<(CLLocation)>] = [wrap(matchable: location) { $0 }]
	        return cuckoo_manager.verify("nextFiveDaysWeatherForecast(location: CLLocation) throws -> [WeatherInformationByDate]", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class WeatherForecastInteractorStub: WeatherForecastInteractor {
    

    

    
     override func currentWeatherInformation(location: CLLocation)  throws -> CurrentWeatherInformation {
        return DefaultValueRegistry.defaultValue(for: CurrentWeatherInformation.self)
    }
    
     override func nextFiveDaysWeatherForecast(location: CLLocation)  throws -> [WeatherInformationByDate] {
        return DefaultValueRegistry.defaultValue(for: [WeatherInformationByDate].self)
    }
    
}


// MARK: - Mocks generated from file: Weather/ForeCast/WeatherForecastView.swift at 2018-07-12 14:41:22 +0000


//
//  WeatherForecastView.swift
//  Weather
//
//  Created by Serge Mbamba on 2018/07/07.
//  Copyright © 2018 Momentum. All rights reserved.
//

import Cuckoo
@testable import Weather

import UIKit

class MockWeatherForecastView: WeatherForecastView, Cuckoo.ProtocolMock {
    typealias MocksType = WeatherForecastView
    typealias Stubbing = __StubbingProxy_WeatherForecastView
    typealias Verification = __VerificationProxy_WeatherForecastView
    let cuckoo_manager = Cuckoo.MockManager(hasParent: false)

    

    

    
    // ["name": "updateSummaryView", "returnSignature": "", "fullyQualifiedName": "updateSummaryView(weatherType: WeatherType, status: DataStatus)", "parameterSignature": "weatherType: WeatherType, status: DataStatus", "parameterSignatureWithoutNames": "weatherType: WeatherType, status: DataStatus", "inputTypes": "WeatherType, DataStatus", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "weatherType, status", "call": "weatherType: weatherType, status: status", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("weatherType"), name: "weatherType", type: "WeatherType", range: CountableRange(228..<252), nameRange: CountableRange(228..<239)), CuckooGeneratorFramework.MethodParameter(label: Optional("status"), name: "status", type: "DataStatus", range: CountableRange(254..<272), nameRange: CountableRange(254..<260))], "returnType": "Void", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
     func updateSummaryView(weatherType: WeatherType, status: DataStatus)  {
        
            return cuckoo_manager.call("updateSummaryView(weatherType: WeatherType, status: DataStatus)",
                parameters: (weatherType, status),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    
    // ["name": "updateDetailView", "returnSignature": "", "fullyQualifiedName": "updateDetailView(weatherType: WeatherType, statuses: [DataStatus])", "parameterSignature": "weatherType: WeatherType, statuses: [DataStatus]", "parameterSignatureWithoutNames": "weatherType: WeatherType, statuses: [DataStatus]", "inputTypes": "WeatherType, [DataStatus]", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "weatherType, statuses", "call": "weatherType: weatherType, statuses: statuses", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("weatherType"), name: "weatherType", type: "WeatherType", range: CountableRange(300..<324), nameRange: CountableRange(300..<311)), CuckooGeneratorFramework.MethodParameter(label: Optional("statuses"), name: "statuses", type: "[DataStatus]", range: CountableRange(326..<348), nameRange: CountableRange(326..<334))], "returnType": "Void", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
     func updateDetailView(weatherType: WeatherType, statuses: [DataStatus])  {
        
            return cuckoo_manager.call("updateDetailView(weatherType: WeatherType, statuses: [DataStatus])",
                parameters: (weatherType, statuses),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    
    // ["name": "reloadNextFiveDaysForecastView", "returnSignature": "", "fullyQualifiedName": "reloadNextFiveDaysForecastView(weatherType: WeatherType)", "parameterSignature": "weatherType: WeatherType", "parameterSignatureWithoutNames": "weatherType: WeatherType", "inputTypes": "WeatherType", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "weatherType", "call": "weatherType: weatherType", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("weatherType"), name: "weatherType", type: "WeatherType", range: CountableRange(390..<414), nameRange: CountableRange(390..<401))], "returnType": "Void", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
     func reloadNextFiveDaysForecastView(weatherType: WeatherType)  {
        
            return cuckoo_manager.call("reloadNextFiveDaysForecastView(weatherType: WeatherType)",
                parameters: (weatherType),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    
    // ["name": "showFiveDaysForecastFailureView", "returnSignature": "", "fullyQualifiedName": "showFiveDaysForecastFailureView()", "parameterSignature": "", "parameterSignatureWithoutNames": "", "inputTypes": "", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "", "call": "", "parameters": [], "returnType": "Void", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
     func showFiveDaysForecastFailureView()  {
        
            return cuckoo_manager.call("showFiveDaysForecastFailureView()",
                parameters: (),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    
    // ["name": "showCurrentWeatherFailureView", "returnSignature": "", "fullyQualifiedName": "showCurrentWeatherFailureView()", "parameterSignature": "", "parameterSignatureWithoutNames": "", "inputTypes": "", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "", "call": "", "parameters": [], "returnType": "Void", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
     func showCurrentWeatherFailureView()  {
        
            return cuckoo_manager.call("showCurrentWeatherFailureView()",
                parameters: (),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    
    // ["name": "updatefiveDaysViewBackgroundColor", "returnSignature": "", "fullyQualifiedName": "updatefiveDaysViewBackgroundColor(_: UIColor?)", "parameterSignature": "_ color: UIColor?", "parameterSignatureWithoutNames": "color: UIColor?", "inputTypes": "UIColor?", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "color", "call": "color", "parameters": [CuckooGeneratorFramework.MethodParameter(label: nil, name: "color", type: "UIColor?", range: CountableRange(543..<560), nameRange: CountableRange(0..<0))], "returnType": "Void", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
     func updatefiveDaysViewBackgroundColor(_ color: UIColor?)  {
        
            return cuckoo_manager.call("updatefiveDaysViewBackgroundColor(_: UIColor?)",
                parameters: (color),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    
    // ["name": "showOfflineAlert", "returnSignature": "", "fullyQualifiedName": "showOfflineAlert()", "parameterSignature": "", "parameterSignatureWithoutNames": "", "inputTypes": "", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "", "call": "", "parameters": [], "returnType": "Void", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
     func showOfflineAlert()  {
        
            return cuckoo_manager.call("showOfflineAlert()",
                parameters: (),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    

	struct __StubbingProxy_WeatherForecastView: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func updateSummaryView<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(weatherType: M1, status: M2) -> Cuckoo.ProtocolStubNoReturnFunction<(WeatherType, DataStatus)> where M1.MatchedType == WeatherType, M2.MatchedType == DataStatus {
	        let matchers: [Cuckoo.ParameterMatcher<(WeatherType, DataStatus)>] = [wrap(matchable: weatherType) { $0.0 }, wrap(matchable: status) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockWeatherForecastView.self, method: "updateSummaryView(weatherType: WeatherType, status: DataStatus)", parameterMatchers: matchers))
	    }
	    
	    func updateDetailView<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(weatherType: M1, statuses: M2) -> Cuckoo.ProtocolStubNoReturnFunction<(WeatherType, [DataStatus])> where M1.MatchedType == WeatherType, M2.MatchedType == [DataStatus] {
	        let matchers: [Cuckoo.ParameterMatcher<(WeatherType, [DataStatus])>] = [wrap(matchable: weatherType) { $0.0 }, wrap(matchable: statuses) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockWeatherForecastView.self, method: "updateDetailView(weatherType: WeatherType, statuses: [DataStatus])", parameterMatchers: matchers))
	    }
	    
	    func reloadNextFiveDaysForecastView<M1: Cuckoo.Matchable>(weatherType: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(WeatherType)> where M1.MatchedType == WeatherType {
	        let matchers: [Cuckoo.ParameterMatcher<(WeatherType)>] = [wrap(matchable: weatherType) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockWeatherForecastView.self, method: "reloadNextFiveDaysForecastView(weatherType: WeatherType)", parameterMatchers: matchers))
	    }
	    
	    func showFiveDaysForecastFailureView() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockWeatherForecastView.self, method: "showFiveDaysForecastFailureView()", parameterMatchers: matchers))
	    }
	    
	    func showCurrentWeatherFailureView() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockWeatherForecastView.self, method: "showCurrentWeatherFailureView()", parameterMatchers: matchers))
	    }
	    
	    func updatefiveDaysViewBackgroundColor<M1: Cuckoo.Matchable>(_ color: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(UIColor?)> where M1.MatchedType == UIColor? {
	        let matchers: [Cuckoo.ParameterMatcher<(UIColor?)>] = [wrap(matchable: color) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockWeatherForecastView.self, method: "updatefiveDaysViewBackgroundColor(_: UIColor?)", parameterMatchers: matchers))
	    }
	    
	    func showOfflineAlert() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockWeatherForecastView.self, method: "showOfflineAlert()", parameterMatchers: matchers))
	    }
	    
	}

	struct __VerificationProxy_WeatherForecastView: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func updateSummaryView<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(weatherType: M1, status: M2) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == WeatherType, M2.MatchedType == DataStatus {
	        let matchers: [Cuckoo.ParameterMatcher<(WeatherType, DataStatus)>] = [wrap(matchable: weatherType) { $0.0 }, wrap(matchable: status) { $0.1 }]
	        return cuckoo_manager.verify("updateSummaryView(weatherType: WeatherType, status: DataStatus)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func updateDetailView<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(weatherType: M1, statuses: M2) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == WeatherType, M2.MatchedType == [DataStatus] {
	        let matchers: [Cuckoo.ParameterMatcher<(WeatherType, [DataStatus])>] = [wrap(matchable: weatherType) { $0.0 }, wrap(matchable: statuses) { $0.1 }]
	        return cuckoo_manager.verify("updateDetailView(weatherType: WeatherType, statuses: [DataStatus])", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func reloadNextFiveDaysForecastView<M1: Cuckoo.Matchable>(weatherType: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == WeatherType {
	        let matchers: [Cuckoo.ParameterMatcher<(WeatherType)>] = [wrap(matchable: weatherType) { $0 }]
	        return cuckoo_manager.verify("reloadNextFiveDaysForecastView(weatherType: WeatherType)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func showFiveDaysForecastFailureView() -> Cuckoo.__DoNotUse<Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("showFiveDaysForecastFailureView()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func showCurrentWeatherFailureView() -> Cuckoo.__DoNotUse<Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("showCurrentWeatherFailureView()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func updatefiveDaysViewBackgroundColor<M1: Cuckoo.Matchable>(_ color: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == UIColor? {
	        let matchers: [Cuckoo.ParameterMatcher<(UIColor?)>] = [wrap(matchable: color) { $0 }]
	        return cuckoo_manager.verify("updatefiveDaysViewBackgroundColor(_: UIColor?)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func showOfflineAlert() -> Cuckoo.__DoNotUse<Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("showOfflineAlert()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class WeatherForecastViewStub: WeatherForecastView {
    

    

    
     func updateSummaryView(weatherType: WeatherType, status: DataStatus)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func updateDetailView(weatherType: WeatherType, statuses: [DataStatus])  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func reloadNextFiveDaysForecastView(weatherType: WeatherType)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func showFiveDaysForecastFailureView()  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func showCurrentWeatherFailureView()  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func updatefiveDaysViewBackgroundColor(_ color: UIColor?)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func showOfflineAlert()  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}

