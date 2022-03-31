/*

The MIT License (MIT)

Copyright (c) 2015 Danil Gontovnik

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

*/

import UIKit
import ObjectiveC

// MARK: -
// MARK: (NSObject) Extension

public extension NSObject {
    
    // MARK: -
    // MARK: Vars
    
    fileprivate struct kmy_associatedKeys {
        static var observersArray = "observers"
    }
    
    fileprivate var kmy_observers: [[String : NSObject]] {
        get {
            if let observers = objc_getAssociatedObject(self, &kmy_associatedKeys.observersArray) as? [[String : NSObject]] {
                return observers
            } else {
                let observers = [[String : NSObject]]()
                self.kmy_observers = observers
                return observers
            }
        } set {
            objc_setAssociatedObject(self, &kmy_associatedKeys.observersArray, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    // MARK: -
    // MARK: Methods
    
    public func kmy_addObserver(_ observer: NSObject, forKeyPath keyPath: String) {
        let observerInfo = [keyPath : observer]
        
        if kmy_observers.index(where: { $0 == observerInfo }) == nil {
            kmy_observers.append(observerInfo)
            addObserver(observer, forKeyPath: keyPath, options: .new, context: nil)
        }
    }
    
    public func kmy_removeObserver(_ observer: NSObject, forKeyPath keyPath: String) {
        let observerInfo = [keyPath : observer]
        
        if let index = kmy_observers.index(where: { $0 == observerInfo}) {
            kmy_observers.remove(at: index)
            removeObserver(observer, forKeyPath: keyPath)
        }
    }
    
}

// MARK: -
// MARK: (UIScrollView) Extension

public extension UIScrollView {
    
    // MARK: - Vars

    fileprivate struct kmy_associatedKeys {
        static var pullToRefreshView = "pullToRefreshView"
    }

    fileprivate var pullToRefreshView: KMYElasticPullToRefreshView? {
        get {
            return objc_getAssociatedObject(self, &kmy_associatedKeys.pullToRefreshView) as? KMYElasticPullToRefreshView
        }

        set {
            objc_setAssociatedObject(self, &kmy_associatedKeys.pullToRefreshView, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    // MARK: - Methods (Public)
    
    public func kmy_addPullToRefreshWithActionHandler(_ actionHandler: @escaping () -> Void, loadingView: KMYElasticPullToRefreshLoadingView?) {
        isMultipleTouchEnabled = false
        panGestureRecognizer.maximumNumberOfTouches = 1

        let pullToRefreshView = KMYElasticPullToRefreshView()
        self.pullToRefreshView = pullToRefreshView
        pullToRefreshView.actionHandler = actionHandler
        pullToRefreshView.loadingView = loadingView
        addSubview(pullToRefreshView)

        pullToRefreshView.observing = true
    }
    
    public func kmy_removePullToRefresh() {
        pullToRefreshView?.disassociateDisplayLink()
        pullToRefreshView?.observing = false
        pullToRefreshView?.removeFromSuperview()
    }
    
    public func kmy_setPullToRefreshBackgroundColor(_ color: UIColor) {
        pullToRefreshView?.backgroundColor = color
    }
    
    public func kmy_setPullToRefreshFillColor(_ color: UIColor) {
        pullToRefreshView?.fillColor = color
    }
    
    public func kmy_stopLoading() {
        pullToRefreshView?.stopLoading()
    }

    public func kmy_startLoading() {
        pullToRefreshView?.startLoading()
    }
}

// MARK: -
// MARK: (UIView) Extension

public extension UIView {
    func kmy_center(_ usePresentationLayerIfPossible: Bool) -> CGPoint {
        if usePresentationLayerIfPossible, let presentationLayer = layer.presentation() {
            // Position can be used as a center, because anchorPoint is (0.5, 0.5)
            return presentationLayer.position
        }
        return center
    }
}

// MARK: -
// MARK: (UIPanGestureRecognizer) Extension

public extension UIPanGestureRecognizer {
    func kmy_resign() {
        isEnabled = false
        isEnabled = true
    }
}

// MARK: -
// MARK: (UIGestureRecognizerState) Extension

public extension UIGestureRecognizer.State {
    func kmy_isAnyOf(_ values: [UIGestureRecognizer.State]) -> Bool {
        return values.contains(where: { $0 == self })
    }
}
