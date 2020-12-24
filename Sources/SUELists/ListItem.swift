/*
 
 Copyright (c) <2020>
 
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

import SwiftUI

public struct ListItem<Detail: View>: View {
    
    @Environment(\.multilineTextAlignment) var multiline
    
    @Environment(\.font) var font
    
    var image : Image?
    var title : String
    var subtitle : String?
    
    var detail : (() -> Detail)?
    
    public init(title: String, subtitle: String? = nil, detail: (() -> Detail)?){
        self.title = title
        self.subtitle = subtitle
        self.detail = detail
    }
    
    public init(icon: Image, title: String, subtitle: String? = nil, detail: (() -> Detail)?){
        self.image = icon
        self.title = title
        self.subtitle = subtitle
        self.detail = detail
    }
    
    public init(icon systemName: String, title: String, subtitle: String? = nil, detail: (() -> Detail)?){
        self.image = Image(systemName: systemName)
        self.title = title
        self.subtitle = subtitle
        self.detail = detail
    }
    
    public init(icon: CGImage? = nil, title: String, subtitle: String? = nil, detail: (() -> Detail)?){
        if let cgimage = icon {
            self.image = Image(decorative: cgimage, scale: 1)
        }
        self.title = title
        self.subtitle = subtitle
        self.detail = detail
    }
    
    public var body: some View {
        HStack{
            if let icon = image {
                icon.resizable().aspectRatio(contentMode: .fit).frame(maxWidth: 30)
            }
            VStack(alignment: .leading){
                Text(title).font(.headline).bold()
                if let sub = subtitle {
                    Text(sub).font(.subheadline).foregroundColor(.secondary)
                }
            }
            Spacer()
            detail?()
        }
    }
}

extension ListItem where Detail == EmptyView {
    
    public init(title: String, subtitle: String? = nil) {
        self.title = title
        self.subtitle = subtitle
    }
    
    public init(icon: Image, title: String, subtitle: String? = nil) {
        self.image = icon
        self.title = title
        self.subtitle = subtitle
    }
    
    public init(icon systemName: String, title: String, subtitle: String? = nil){
        self.image = Image(systemName: systemName)
        self.title = title
        self.subtitle = subtitle
    }
    
    public init(icon: CGImage? = nil, title: String, subtitle: String? = nil){
        if let cgimage = icon {
            self.image = Image(decorative: cgimage, scale: 1)
        }
        self.title = title
        self.subtitle = subtitle
    }
}

struct ListItem_Previews: PreviewProvider {
    
    static var previews: some View {
        
        Group {
            ListItem(title: "Title")
            ListItem(title: "Title", subtitle: "Subtitle")
            ListItem(icon: "photo", title: "Title", subtitle: "Subtitle")
            ListItem(icon: "photo", title: "Title")
            ListItem(title: "Title"){
                Text("METADATA").font(.system(.body, design: .monospaced))
            }
            ListItem(title: "Title", subtitle: "Subtitle"){
                Text("METADATA").font(.system(.body, design: .monospaced))
            }
            ListItem(icon: "photo", title: "Title", subtitle: "Subtitle"){
                Text("METADATA").font(.system(.body, design: .monospaced))
            }
            ListItem(icon: "photo", title: "Title"){
                Text("METADATA").font(.system(.body, design: .monospaced))
            }
        }
    }
}
