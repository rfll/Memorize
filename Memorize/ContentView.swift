import SwiftUI

struct ContentView: View {
    
    var sportsThemeEmojis: [String] = ["🏀", "🎱", "🥊", "⚾️", "🛹", "🏓", "⛳️", "🏈", "🏂", "🛼", "⚽️", "🥌"]
    
    var facesThemeEmojis: [String] = ["🥳", "😋", "🤩", "🥸", "🤣", "😎", "🤬", "🥵", "😶‍🌫️", "🤮", "🤡", "👽", "☠️", "🫠"]
    
    var animalsThemeEmojis: [String] = ["🐶", "🐣", "🦄", "🐝", "🐷", "🦆", "🐻", "🐠", "🐓", "🦞", "🐋", "🐯", "🦁", "🐮", "🐌", "🦛"]
    
    @State var emojis: [String] = ["🏀", "🎱", "🥊", "⚾️", "🛹", "🏓", "⛳️", "🏈", "🏂", "🛼", "⚽️", "🥌"]
    @State var emojiCount = 4
    
    var body: some View {
        VStack {
            Text("Memorize")
                .font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            Spacer()
            HStack {
                sportsThemeButton
                Spacer()
                facesThemeButton
                Spacer()
                animalsThemeButton
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
        .foregroundColor(.orange)
    }
    
    var sportsThemeButton: some View {
        Button {
            emojis = sportsThemeEmojis.shuffled()
            emojiCount = Int.random(in: 8..<sportsThemeEmojis.count)
        } label: {
            VStack {
                Image(systemName: "sportscourt.fill")
                Text("Sports")
                    .font(.title3)
                    .padding(0.5)
            }
        }
    }
    
    var facesThemeButton: some View {
        Button {
            emojis = facesThemeEmojis.shuffled()
            emojiCount = Int.random(in: 8..<facesThemeEmojis.count)
        } label: {
            VStack {
                Image(systemName: "face.smiling")
                Text("Faces")
                    .font(.title3)
                    .padding(0.5)
            }
        }
    }
    
    var animalsThemeButton: some View {
        Button {
            emojis = animalsThemeEmojis.shuffled()
            emojiCount = Int.random(in: 8..<animalsThemeEmojis.count)
        } label: {
            VStack {
                Image(systemName: "pawprint.fill")
                Text("Animals")
                    .font(.title3)
                    .padding(0.5)
            }
        }
    }
    
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack{
            let shape =  RoundedRectangle(cornerRadius: 20)
            
            if isFaceUp {
                shape.fill(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}


















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}
