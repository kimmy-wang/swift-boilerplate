# KMYElasticPullToRefresh
Elastic pull to refresh component developed in Swift

<p align="center">
<a href="https://developer.apple.com/swift"><img src="https://img.shields.io/badge/language-swift5-f48041.svg?style=flat"></a>
<a href="http://cocoadocs.org/docsets/SwiftTheme"><img src="https://img.shields.io/cocoapods/v/SwiftTheme.svg?style=flat"></a>
<a href="https://github.com/Carthage/Carthage"><img src="https://img.shields.io/badge/carthage-compatible-4BC51D.svg?style=flat"></a>
<a href="https://developer.apple.com/ios"><img src="https://img.shields.io/badge/platform-iOS%209%2B | tvOS%209%2B-blue.svg?style=flat"></a>
<a href="https://github.com/wxxsw/SwiftTheme/blob/master/LICENSE"><img src="http://img.shields.io/badge/license-MIT-lightgrey.svg?style=flat"></a>
</p>

Inspired by this Dribbble post: [Pull Down to Refresh](https://dribbble.com/shots/2232385-Pull-Down-to-Refresh) by [Hoang Nguyen](https://dribbble.com/Hoanguyen)

Tutorial on how this bounce effect was achieved can be found [here](https://medium.com/@gontovnik/elastic-view-animation-or-how-i-built-dgelasticpulltorefresh-269a3ba8636e#.9dioekqv6).

![](https://raw.githubusercontent.com/see/KMYElasticPullToRefresh/master/KMYElasticPullToRefreshPreview1.gif)
![](https://raw.githubusercontent.com/see/KMYElasticPullToRefresh/master/KMYElasticPullToRefreshPreview2.gif)

## Requirements
* Xcode 8 or higher
* iOS 9 or higher (may work on previous versions, just did not test it)
* ARC
* Swift 4.2

## Demo

Open and run the KMYElasticPullToRefreshExample project in Xcode to see KMYElasticPullToRefresh in action.

## Installation

### CocoaPods

``` ruby
pod 'KMYElasticPullToRefresh'
```

### Manual

Add KMYElasticPullToRefresh folder into your project.

## Example usage

``` swift
// Initialize tableView
let loadingView = KMYElasticPullToRefreshLoadingViewCircle()
loadingView.tintColor = UIColor(red: 78/255.0, green: 221/255.0, blue: 200/255.0, alpha: 1.0)
tableView.kmy_addPullToRefreshWithActionHandler({ [weak self] () -> Void in
    // Add your logic here
    // Do not forget to call kmy_stopLoading() at the end
    self?.tableView.kmy_stopLoading()
}, loadingView: loadingView)
tableView.kmy_setPullToRefreshFillColor(UIColor(red: 57/255.0, green: 67/255.0, blue: 89/255.0, alpha: 1.0))
tableView.kmy_setPullToRefreshBackgroundColor(tableView.backgroundColor!)
```

Do not forget to remove pull to refresh on view controller deinit. It is a temporary solution.

``` swift
deinit {
    tableView.kmy_removePullToRefresh()
}
```

### Description

Add pull to refresh without loading view:

``` swift
func kmy_addPullToRefreshWithActionHandler(_ actionHandler: @escaping () -> Void)
```

Add pull to refresh with loading view:

``` swift
func kmy_addPullToRefreshWithActionHandler(_ actionHandler: @escaping () -> Void, loadingView: DGElasticPullToRefreshLoadingView?)
```

You can use built-in *DGElasticPullToRefreshLoadingViewCircle* or create your own by subclassing **DGElasticPullToRefreshLoadingView** and implementing these methods:

``` swift
func setPullProgress(_ progress: CGFloat)
func startAnimating()
func stopLoading()
```

Remove pull to refresh:

``` swift
func kmy_removePullToRefresh()
```

Set auto start loading:

``` swift
func kmy_startLoading()
```

Change pull to refresh background color:

``` swift
func kmy_setPullToRefreshBackgroundColor(_ color: UIColor)
```

Change pull to refresh fill color:

``` swift
func kmy_setPullToRefreshFillColor(_ color: UIColor)
```

## Contribution

Please feel free to submit pull requests. Cannot wait to see your custom loading views for this pull to refresh.

## License

The MIT License (MIT)
