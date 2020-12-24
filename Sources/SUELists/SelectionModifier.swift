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

struct SelectionModifier : ViewModifier {
    
    var selected : Bool
    
    func body(content: Content) -> some View {
        content
            .padding(.vertical, 3)
            .padding(.horizontal, 6)
            .background(back)
        
    }
    
    var back : some View {
        Rectangle().foregroundColor(selected ? .accentColor : Color.secondary.opacity(0.01))
    }
}

extension ListItem {
    
    public func select(_ criterion: Bool) -> some View {
        return self.modifier(SelectionModifier(selected: criterion))
    }
    
}

struct SelectionModifier_Previews: PreviewProvider {
    
    static var previews: some View {
        
        Group {
            ListItem(title: "Title").select(true)
            ListItem(title: "Title", subtitle: "Subtitle").select(true)
            ListItem(icon: "photo", title: "Title", subtitle: "Subtitle").select(true)
            ListItem(icon: "photo", title: "Title").select(true)
            ListItem(title: "Title"){
                Text("METADATA").font(.system(.body, design: .monospaced))
            }.select(true)
            ListItem(title: "Title", subtitle: "Subtitle"){
                Text("METADATA").font(.system(.body, design: .monospaced))
            }.select(true)
            ListItem(icon: "photo", title: "Title", subtitle: "Subtitle"){
                Text("METADATA").font(.system(.body, design: .monospaced))
            }.select(true)
            ListItem(icon: "photo", title: "Title"){
                Text("METADATA").font(.system(.body, design: .monospaced))
            }.select(true)
        }
    }
}
