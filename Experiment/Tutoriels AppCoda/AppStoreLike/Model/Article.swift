//
//  Article.swift
//  SwiftUIAppStore
//
//  Created by Simon Ng on 10/9/2020.
//

import SwiftUI

struct Article: Identifiable {
    var id = UUID()
    var category: String
    var headline: String
    var subHeadline: String
    var content: String
    var image: UIImage
}


var megaContent = """
I enjoy so much working with the SwiftUI framework. Like most new frameworks, however, one drawback is that it doesn’t come with all UI controls which are available in UIKit. For example, you can’t find a SwiftUI counterpart of text view. Thankfully, Apple provided a protocol called UIViewRepresentable that allows you easily wrap a UIView and make it available to your SwiftUI project.\n\nIn this article, we will show you how to create a text view by wrapping the UITextView class from UIKit using UIViewRepresentable.\n\nTo use a UIKit view in SwiftUI, you can wrap the view with the UIViewRepresentable protocol. Basically, you just need to create a struct in SwiftUI that adopts the protocol to create and manage a UIView object. Here is the skeleton of the custom wrapper for a UIKit view.

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus efficitur sapien eget consectetur dignissim. Donec ullamcorper felis id urna auctor, quis varius libero semper. Etiam molestie sapien ac rhoncus finibus. Morbi gravida congue orci, et lacinia velit luctus ut. Fusce consequat accumsan laoreet. Quisque ornare eget erat sit amet egestas. Vivamus nisl mi, feugiat tincidunt auctor congue, congue at enim. Duis sodales bibendum arcu a euismod. Vivamus id fermentum sapien, quis hendrerit diam. Quisque vitae turpis eu eros cursus rhoncus. Phasellus a leo tincidunt, porta justo at, ultrices odio. Proin in urna laoreet, blandit dui a, efficitur enim. Curabitur sit amet luctus risus, quis condimentum elit. Aliquam at urna luctus, pellentesque risus sit amet, imperdiet velit. Maecenas eget gravida dolor. Aliquam finibus ultrices condimentum.

Nullam pellentesque blandit cursus. Pellentesque dignissim interdum pulvinar. Vivamus viverra vestibulum rutrum. Etiam commodo, turpis et bibendum tincidunt, elit nunc convallis mauris, ut suscipit eros erat in elit. Pellentesque at sagittis nunc. Mauris faucibus, mi tempus condimentum cursus, eros sem congue augue, non viverra metus ipsum in lectus. Proin ac dictum nisl, vitae hendrerit elit. Nam quis mauris justo. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Suspendisse vitae mollis nulla. Suspendisse vel velit eget odio fringilla venenatis eu vitae libero. Etiam ornare, dui vitae egestas lacinia, purus tellus ultrices elit, nec auctor tellus enim cursus magna.

Vestibulum malesuada eu augue nec scelerisque. Maecenas fringilla, tellus non consectetur ultrices, lectus libero maximus augue, vel congue nisi felis ac mi. Mauris erat purus, sodales sit amet porta nec, interdum vitae tortor. Donec urna mauris, vulputate ac lacus ac, luctus suscipit erat. Etiam nec ante nulla. Vestibulum vel justo id nibh aliquam pellentesque. Donec hendrerit dui eu faucibus vestibulum. Etiam tincidunt iaculis odio a laoreet. Pellentesque malesuada nec elit sit amet iaculis. Etiam a nunc lorem. Quisque ut magna nunc. Sed faucibus purus ac ante pretium, at facilisis quam varius. Mauris aliquam eros sapien, non hendrerit tellus porta nec.

Pellentesque laoreet sollicitudin magna et finibus. Donec aliquet blandit lectus, eu viverra sem interdum et. Nulla facilisi. Aenean pellentesque eget ligula eget luctus. Vestibulum a nulla fermentum, feugiat ex sed, efficitur justo. Duis suscipit orci est, eu ullamcorper augue ornare at. Quisque sodales condimentum condimentum. Fusce dignissim metus metus, tempus sodales eros sagittis ac. Sed quis posuere magna, in ornare purus. Sed risus sem, finibus at est a, lobortis aliquam ipsum. Nam augue arcu, bibendum vitae risus id, vulputate faucibus tellus.

Fusce viverra leo ac ante facilisis ullamcorper. Vivamus porttitor velit sit amet tincidunt ornare. Aenean aliquam ut nunc vel maximus. Aenean mollis bibendum elit quis congue. Suspendisse sit amet placerat metus, ut dictum est. Vivamus commodo arcu sagittis ante fermentum suscipit. Maecenas et sodales urna. Mauris gravida suscipit mauris non vestibulum. Phasellus blandit elementum tristique. Aenean placerat leo ac felis interdum, a elementum purus sodales. Curabitur rutrum id est eu pharetra. Ut non convallis lorem. Suspendisse interdum, nisl in ultrices congue, quam odio mattis urna, ut varius est ante at arcu. Mauris eleifend accumsan ante, a mattis nisl maximus quis. Nullam scelerisque neque in ullamcorper rutrum.
"""

#if DEBUG
var sampleArticles = [
    Article(category: "App of the Day", headline: "Adobe Premiere Rush CC is built to share", subHeadline: "Step up your video skills with these tips", content: megaContent, image: UIImage(named: "egg")!),
    
    Article(category: "SwiftUI Framework", headline: "Building a SwiftUI Search Bar", subHeadline: "Learn how to integrate UIKit with SwiftUI using UIViewRepresentable and build a search bar", content: megaContent, image: UIImage(named: "mac-1")!),
    
    Article(category: "Swift Language", headline: "A Beginner's Guide to Access Levels", subHeadline: "Today we we are going to talk about a topic that usually everybody knows something more or less, but it’s important for new developers in Swift to really understand", content: megaContent, image: UIImage(named: "ipad-1")!),
    
    Article(category: "Music Kit", headline: "Introduction to MusicKit: Building a Music Player in SwiftUI", subHeadline: "In this tutorial series, we’ll be building a very simple music player that searches using the Apple Music API for a song.", content: megaContent, image: UIImage(named: "mac-4")!),
    
    Article(category: "Swift Language", headline: "Understanding Higher Order Functions in Swift", subHeadline: "From the practical point of view in real world programming, higher order functions consist all together of a great tool that we can only have benefits from", content: megaContent, image: UIImage(named: "iphone-2")!),
    
    Article(category: "macOS Development", headline: "Implementing Drag And Drop Operations Using NSPasteboard", subHeadline: "One of the most common operations macOS users perform and they are quite familiar with is drag and drop.", content: megaContent, image: UIImage(named: "mac-3")!),
    
    Article(category: "Swift Playgrounds", headline: "Learn SwiftUI Using Swift Playgrounds for iPad", subHeadline: "I only have an iPad. Can I use it to develop iOS apps?", content: megaContent, image: UIImage(named: "mac-2")!),
    
    Article(category: "macOS Development", headline: "Creating Status Bar Apps on macOS", subHeadline: "We are just about to learn how to create status bar apps, or in other words, apps that live on the macOS top bar right next to the clock and other system", content: megaContent, image: UIImage(named: "mac-5")!)
                ]
#endif

