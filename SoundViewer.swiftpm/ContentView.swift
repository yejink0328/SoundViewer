import SwiftUI

extension View {
    func NavButtonStyle() -> some View {
        self.frame(width: 320/2, height: 60)
            .buttonStyle(PlainButtonStyle())
            .foregroundColor(Color.white)
            .padding(10)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.white, lineWidth: 2))
    }
}

extension View {
    func NavButtonStyle1() -> some View {
        self.frame(width: 350, height: 30)
            .buttonStyle(PlainButtonStyle())
            .foregroundColor(Color.white)
            .padding(10)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.white, lineWidth: 2))
    }
}


struct CircleView: View {
    
    @State private var scale: CGFloat = 1.0
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.white, lineWidth: 1)
                .frame(width: 200)
                .scaleEffect(scale)
                .opacity(2-scale)
                .animation(.easeOut(duration: 1).repeatForever(autoreverses: false), value: scale)
                .onAppear{
                    self.scale = 2
                }
            
            Circle()
                .stroke(Color.white, lineWidth: 2)
                .frame(width: 200)
                .scaleEffect(scale)
                .opacity(2-scale)
                .animation(.easeOut(duration: 1.5).repeatForever(autoreverses: false), value: scale)
                .onAppear{
                    self.scale = 2
                }
        }
    }
}

struct ContentView: View {

    var body: some View {
        NavigationView{
            ZStack{
                
                Color.black.ignoresSafeArea()
                
                VStack{
                    ZStack{
                        Image("SoundViewer_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150.0)
                            .offset(x: 0, y: 100)
                        
                        Text("SoundViewer")
                            .foregroundColor(.white)
                            .font(.system(size: 50, weight: .bold))
                            .offset(x: 0, y: -20)
                    }
                    
                    Spacer()
                        .frame(height: 120)
                    
                        NavigationLink(destination: IntroScript()) {
                            Text("Introduction")
                                .NavButtonStyle1()
                        }
                    HStack{
                            NavigationLink(destination: VideoView()) {
                                Text("Video and Sound")
                                    .NavButtonStyle()
                            }
                        
                            NavigationLink(destination: AlarmView()) {
                                Text("Alarm and Sound")
                                    .NavButtonStyle()
                            }
                    }
                    
                    HStack{
                        NavigationLink(destination: DirectionView()) {
                            Text("Direction and Sound")
                                .NavButtonStyle()
                        }
                        
                        NavigationLink(destination: WeightView()) {
                            Text("Dull and Clear")
                                .NavButtonStyle()
                        }
                    }
                    HStack{
                        NavigationLink(destination: ShapeView()) {
                            Text("Intonation and Shape")
                                .NavButtonStyle()
                        }
                        
                        NavigationLink(destination: PitchNamesView()) {
                            Text("Musical scales and Colors")
                                .NavButtonStyle()
                        }
                    }
                    NavigationLink(destination: OutroScript()) {
                        Text("Closing remarks")
                            .NavButtonStyle1()
                    }
                    
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct IntroScript: View {
    
    @State private var scriptNumber: Int = 0
    @State var appearButton: Bool = false
    
    let appScripts = [
            """
            Hello, everyone.
            """,
            """
            I'm pleased to invite you to my app,
            """,
            """
            which is themed 'Visualization of Sound'.
            """,
            """
            When I was younger, I was really interested in expressing my senses in different ways,
            """,
            """
            and synesthesia was a fascinating topic for me.
            """,
            """
            Then, one day,
            I stumbled upon a problem.
            """,
            """
            First, let's take a quick quiz.
            """
    ]
    
    var body: some View {
        ZStack{
            Color.black
            VStack{
                    Text(appScripts[scriptNumber])
                        .foregroundColor(.white)
                        .font(.system(size: 36))
                        .padding()
                
                if appearButton {
                    NavigationLink(destination: VideoView()) {
                        Text("Quize")
                            .NavButtonStyle()
                    }
                }
            }
        }
            .ignoresSafeArea()
            .onTapGesture {
                if (scriptNumber < appScripts.count - 1) {
                    self.scriptNumber += 1
                }
                if (self.scriptNumber == appScripts.count - 1) {
                    self.appearButton = true
                }
            }
        }
    }


struct VideoView: View {
    
    @State private var yesOrNo = false
    @State private var scriptNumber: Int = 0
    @State var appearButton: Bool = false
    
    let appScripts = [
            """
            Here's a video playing.
            """,
            """
            Is there any sound in this video?
            """,
            """
            The answer is
            'There is no sound to begin with.'
            """,
            """
            However, To figure out the answer, you'll need to check the volume of this device.
            """,
            """
            Until then, you cannot know if it's muted or if there was never any sound to begin with.
            """,
            """
            As we watch videos and communicate through them more often,
            """,
            """
            we sometimes experience not being able to hear sound, even when it's there.
            """,
            """
            This isn't just a problem for people with hearing difficulties anymore.
            """,
            """
            So, I have an idea.
            """,
            """
            What if we could see the sound?
            """,
            """
            Like this!
            """
    ]
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack{
                ZStack {
                    Image("Video")
                        .resizable()
                        .scaledToFit()
                        .border(Color.white, width: 2)
                        .frame(width: 400.0, height: 300)
                        .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 4)
                    if appearButton {
                        CircleView()
                    }
                }
                VStack(spacing: 10){
                    Text(appScripts[scriptNumber])
                        .foregroundColor(.white)
                        .font(.system(size: 36))
                        .padding()
                        .position(x: 200, y: 100)
                    
                    if yesOrNo {
                        VStack(spacing: 5){
                            Text("There is sound, but I can't hear it.")
                                .NavButtonStyle1()
                            Text("There is no sound to begin with.")
                                .NavButtonStyle1()
                        }.onTapGesture {
                            self.yesOrNo = false
                            self.scriptNumber += 1
                        }
                        .position(x: 200, y: 50)
                    }
                    
                    if appearButton {
                        NavigationLink(destination: AlarmView()) {
                            Text("In addition to that")
                                .NavButtonStyle()
                                .position(x: 200, y: 50)
                        }
                    }
                }
            }
        }.onTapGesture {
                    if !yesOrNo && (scriptNumber < appScripts.count - 1) {
                        self.scriptNumber += 1
                    }
                    if (self.scriptNumber == appScripts.count - 1) {
                        self.appearButton = true
                    }
                    if (self.scriptNumber == 1) {
                        self.yesOrNo = true
                    }
                }
            }
            
        }

struct AlarmView: View {
    
    @State private var scale: CGFloat = 1.0
    @State private var scriptNumber: Int = 0
    @State var appearButton: Bool = false
    @State var appearMessage: Bool = false
    
    let appScripts = [
            """
            We can apply this sound effect to various situations.
            """,
            """
            For example,
            """,
            """
            we could use it in text messages or apps
            """,
            """
            to indicate that a new message has arrived.
            """
    ]
    
    var body: some View {
        ZStack {
            Color.black
            VStack(spacing: 30){
                Text(appScripts[scriptNumber])
                    .foregroundColor(.white)
                    .font(.system(size: 36))
                    .padding()
                
                if appearButton {
                    NavigationLink(destination: DirectionView()) {
                        Text("Furthermore,")
                            .NavButtonStyle()
                    }
                }
            
            }
            ZStack{
                Image("message")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 80)
                
                if appearMessage && !appearButton {
                    Circle()
                        .stroke(Color.white, lineWidth: 1)
                        .frame(width: 100)
                        .scaleEffect(scale)
                        .opacity(2-scale)
                        .animation(.easeOut(duration: 1).repeatForever(autoreverses: false), value: scale)
                        .onAppear{
                            self.scale = 2
                        }
                    }
            }
            .offset(x: -100, y: 300)
            .onTapGesture {
                appearButton = true
            }
        }
        .ignoresSafeArea()
        .onTapGesture {
            if (scriptNumber < appScripts.count - 1) {
                self.scriptNumber += 1
            }
            if (self.scriptNumber == appScripts.count - 1) {
                self.appearMessage = true
            }
        }
    }
}

struct DirectionView: View {
    
    @State private var scriptNumber: Int = 0
    @State private var directionNumber: Int = 0
    @State var appearButton: Bool = false
    @State private var yesOrNo = false
    
    let appScripts = [
            """
            We can also indicate the direction of the sound we hear.
            """,
            """
            When you hear a sound to your
            """,
            """
            By varying the size of the shapes,
            """,
            """
            you can tell how far away the sound is.
            """
    ]
    
    let direction = ["RIGHT", "FRONT", "BEHIND", "LEFT"]
    
    let X = [100, -100, -50, -300, -300] // -300일 때 왼, 100일 때 오, -100 중간
    let Y = [-300, -550, 300, 100, 200] // -550 위, 300 아래
    
    var body: some View {
        ZStack {
            Color.black
            VStack{
                Text(appScripts[scriptNumber])
                    .foregroundColor(.white)
                    .font(.system(size: 36))
                    .padding()
                
                if yesOrNo {
                        Text(direction[directionNumber])
                            .foregroundColor(.white)
                            .font(.system(size: 50, weight: .bold))
                            .padding()
                    }
                
                if appearButton {
                    NavigationLink(destination: WeightView()) {
                        Text("And...")
                            .NavButtonStyle()
                    }
                }
            }
            GeometryReader { geometry in
                    if (directionNumber <= 0) && (scriptNumber==1) || (scriptNumber >= 2){
                        ZStack{
                            Circle()
                                .stroke(Color.white, lineWidth: 5)
                                .frame(width: 200)
                            CircleView()
                        }
                        .offset(x: (geometry.size.width / 2) + CGFloat(X[0]), y: (geometry.size.height / 2) + CGFloat(Y[0]))
                    }
                if (directionNumber == 1) || (scriptNumber >= 2){
                    ZStack{
                        Circle()
                            .stroke(Color.white, lineWidth: 5)
                            .frame(width: 200)
                        CircleView()
                    }
                    .offset(x: (geometry.size.width / 2) + CGFloat(X[1]), y: (geometry.size.height / 2) + CGFloat(Y[1]))
                }
                if (directionNumber == 2) || (scriptNumber >= 2){
                    ZStack{
                        Circle()
                            .stroke(Color.white, lineWidth: 5)
                            .frame(width: 200)
                        CircleView()
                    }
                    .offset(x: (geometry.size.width / 2) + CGFloat(X[2]), y: (geometry.size.height / 2) + CGFloat(Y[2]))
                }
                if (directionNumber == 3) || (scriptNumber >= 2){
                    ZStack{
                        Circle()
                            .stroke(Color.white, lineWidth: 5)
                            .frame(width: 200)
                        CircleView()
                    }
                    .offset(x: (geometry.size.width / 2) + CGFloat(X[3]), y: (geometry.size.height / 2) + CGFloat(Y[3]))
                }
                }
            }
        .ignoresSafeArea()
        .onTapGesture {
            if !yesOrNo && (scriptNumber < appScripts.count - 1) {
                self.scriptNumber += 1
            }else{
                self.directionNumber += 1

            }
            if (self.scriptNumber == appScripts.count - 1) {
                self.appearButton = true
            }
            if (self.scriptNumber == 1) {
                self.yesOrNo = true
            }
            if yesOrNo && (self.directionNumber == direction.count) {
                self.scriptNumber += 1
                self.yesOrNo = false
            }
            
        }
    }
}

struct WeightView: View {
    
    @State private var scriptNumber: Int = 0

    @State var appearButton: Bool = false
    @State private var scale: CGFloat = 1.0
    
    @State private var animate = false
    @State private var animate1 = false
    
    let appScripts = [
            """
            What about the dullness and clarity of sound?
            """,
            """
            We know that the sound produced
            """,
            """
            when a heavy object falls is different from that of a light object.
            """,
            """
            This can be illustrated by varying the thickness of a circle.
            """
    ]
    
    var body: some View {
        
        ZStack {
            Color.black
            VStack(spacing: 10){
                Text(appScripts[scriptNumber])
                    .foregroundColor(.white)
                    .font(.system(size: 36))
                    .padding()
                
                if appearButton {
                    NavigationLink(destination: ShapeView()) {
                        Text("We can change...")
                            .NavButtonStyle()
                    }
                }
                
                HStack(spacing: 30){
                    ZStack{
                            Circle()
                                .stroke(Color.white, lineWidth: 10)
                                .frame(width: 200)
                                .scaleEffect(scale)
                                .opacity(2-scale)
                                .animation(.easeOut(duration: 1.5).repeatForever(autoreverses: false), value: scale)
                                .onAppear{
                                    self.scale = 2
                                }
                        Rectangle()
                            .fill(.white)
                            .frame(width: 100, height: 100)

                    }
                    .offset(y: animate ? 230 : 0)
                    .animation(.easeOut(duration: 0.5), value: animate)
                    .onTapGesture {
                        withAnimation {
                            self.animate.toggle()
                        }
                    }
                    
                    ZStack{
                        Circle()
                            .stroke(Color.white, lineWidth: 1)
                            .frame(width: 100)
                            .scaleEffect(scale)
                            .opacity(2-scale)
                            .animation(.easeOut(duration: 1).repeatForever(autoreverses: false), value: scale)
                            .onAppear{
                                self.scale = 2
                            }
                        Rectangle()
                            .fill(.white)
                            .frame(width: 50, height: 50)
                    }
                    .offset(y: animate1 ? 230 : 0)
                    .animation(.easeOut(duration: 0.2), value: animate1)
                    .onTapGesture {
                        withAnimation {
                            self.animate1.toggle()
                        }
                    }
                }
            }
        }
        .ignoresSafeArea()
        .onTapGesture {
            if (scriptNumber < appScripts.count - 1) {
                self.scriptNumber += 1
            }
            if (self.scriptNumber == appScripts.count - 1) {
                self.appearButton = true
            }
        }
    }
}

struct ShapeView: View {
    
    @State private var scriptNumber: Int = 0
    @State var appearButton: Bool = false
    
    let appScripts = [
            """
            We can change the shape of the circle, too!
            """,
            """
            In comics, speech bubbles change shape based on the characters' tone.
            """,
            """
            We can emulate this to indicate the character of a heard sound.
            """,
            """
            When talking to someone, This can make the conversation more enjoyable.
            """
    ]
    
    let speechBalloons = [
        "speech_balloon3",
        "speech_balloon2",
        "speech_balloon",
        "speech_balloon1"
    ]
    
    @State private var scale: CGFloat = 1.0
    @State private var scale1: CGFloat = 1.0
    @State private var scale2: CGFloat = 1.0
    @State private var scale3: CGFloat = 1.0
    
    @State private var tapCounter: Int = 0
    
    @State private var ballon: Bool = false
    @State private var ballon1: Bool = false
    @State private var ballon2: Bool = false
    @State private var ballon3: Bool = false
    
    var body: some View {
        ZStack {
            Color.black
            VStack {
                
                ZStack{
                    Image(speechBalloons[scriptNumber])
                        .resizable()
                        .scaledToFit()
                        .frame(width: 450.0, height: 300.0)
                    Text(appScripts[scriptNumber])
                        .foregroundColor(.white)
                        .font(.system(size: 24))
                        .multilineTextAlignment(.center)
                        .frame(width: 250.0)
                        .lineSpacing(10)
                        .padding()
                }
                HStack{
                    ZStack{
                        Image("speech_balloon3")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150.0)
                        if ballon3 {
                            Image("speech_balloon3")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150.0)
                                .scaleEffect(scale3)
                                .opacity(2-scale3)
                                .animation(.easeOut(duration: 1).repeatForever(autoreverses: false), value: scale3)
                                .onAppear{
                                    self.scale3 = 2.0
                                }
                        }
                    }.onTapGesture {
                        ballon3.toggle()
                    }
                    
                    ZStack{
                        Image("speech_balloon2")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150.0)
                        if ballon2 {
                            Image("speech_balloon2")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150.0)
                                .scaleEffect(scale2)
                                .opacity(2-scale2)
                                .animation(.easeOut(duration: 1).repeatForever(autoreverses: false), value: scale2)
                                .onAppear{
                                    scale2 = 2.0
                                }
                        }
                    }.onTapGesture {
                        ballon2.toggle()
                    }
                }
                HStack{
                    ZStack{
                        Image("speech_balloon1")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150.0)
                        if ballon1 {
                            Image("speech_balloon1")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150.0)
                                .scaleEffect(scale1)
                                .opacity(2-scale1)
                                .animation(.easeOut(duration: 1).repeatForever(autoreverses: false), value: scale1)
                                .onAppear{
                                    self.scale1 = 2.0
                                }
                        }
                    }.onTapGesture {
                        self.ballon1.toggle()
                    }
                    
                    ZStack{
                        Image("speech_balloon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150.0)
                        if ballon {
                            Image("speech_balloon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150.0)
                                .scaleEffect(scale)
                                .opacity(2-scale)
                                .animation(.easeOut(duration: 1).repeatForever(autoreverses: false), value: scale)
                                .onAppear{
                                    self.scale = 2.0
                                }
                        }
                    }.onTapGesture {
                        self.ballon.toggle()
                    }
                }
                
                if appearButton {
                    NavigationLink(destination: PitchNamesView()) {
                        Text("What about the...")
                            .NavButtonStyle()
                    }
                }

            }
        }
        .ignoresSafeArea()
        .onTapGesture {
            if (scriptNumber < appScripts.count - 1) {
                self.scriptNumber += 1
            }
            if (self.scriptNumber == appScripts.count - 1) {
                self.appearButton = true
            }
        }
    }
}

struct PitchNamesView: View {
    
    @State private var scale: CGFloat = 1.0
    
    @State var selectedButton: Int? = nil
    let colors = [Color.red, Color.orange, Color.yellow, Color.green, Color.blue]
    let buttonNames = ["Do", "Re", "Mi", "Fa", "Sol"]
    
    @State private var scriptNumber: Int = 0
    @State var appearButton: Bool = false
    
    let appScripts = [
            """
            What about the color?
            """,
            """
            We can also visualize musical notes.
            """,
            """
            By using different colors, we can recognize which sound is being played.
            """,
            """
            Moreover, we can create sounds by drawing shapes with colors.
            """,
            """
            When multiple colored circles appear at once, it would resemble a fireworks display.
            """
    ]
    
    var body: some View {
        ZStack {
            Color.black
            VStack(spacing: 30) {
                
                VStack(spacing: 50) {
                    Text(appScripts[scriptNumber])
                        .foregroundColor(.white)
                        .font(.system(size: 36))
                        .padding()
                
                    ZStack{
                        Circle()
                            .stroke(selectedButton == nil ? Color.white : colors[selectedButton!], lineWidth: 5)
                            .frame(width: 150)
                        
                        Circle()
                            .stroke(selectedButton == nil ? Color.white : colors[selectedButton!], lineWidth: 1)
                            .frame(width: 150)
                            .scaleEffect(scale)
                            .opacity(2-scale)
                            .animation(.easeOut(duration: 1).repeatForever(autoreverses: false), value: scale)
                            .onAppear{
                                self.scale = 2
                            }
                    }
                
                HStack(spacing: 10) {
                            ForEach(0..<5) { index in
                                Button(action: {
                                    selectedButton = index
                                }) {
                                    Text("\(buttonNames[index])")
                                        .padding()
                                        .font(.system(size: 20, weight: .bold))
                                        .foregroundColor(selectedButton == index ? Color.white : colors[index])
                                        .background(selectedButton == index ? colors[index] : Color.white)
                                        .cornerRadius(10)
                                }
                            }
                        }
                        .padding()
                    
                    if appearButton {
                        NavigationLink(destination: OutroScript()) {
                            Text("As a result...")
                                .NavButtonStyle()
                        }
                    }
                }
            }
        }
        .ignoresSafeArea()
        .onTapGesture {
            if (scriptNumber < appScripts.count - 1) {
                self.scriptNumber += 1
            }
            if (self.scriptNumber == appScripts.count - 1) {
                self.appearButton = true
            }
        }
    }
}

struct OutroScript: View {
    
    @State private var scriptNumber: Int = 0
    @State var appearButton: Bool = false
    
    let appScripts = [
            """
            So far, we have seen various ways of visually representing sound.
            """,
            """
            By further developing and combining these methods,
            """,
            """
            we hope to create richer expressions.
            """,
            """
            Smartphones have now become the sixth sense that expands our five senses.
            """,
            """
            We expect to make use of this to allow people to draw and perceive everything they see and hear more freely.
            """
    ]
    
    var body: some View {
            ZStack {
                Color.black
                VStack {
                    Text(appScripts[scriptNumber])
                        .foregroundColor(.white)
                        .font(.system(size: 36))
                        .padding()
                    if appearButton {
                        NavigationLink(destination: ContentView()) {
                            Text("Thank you for watching!")
                                .NavButtonStyle()
                        }
                    }
                }
            }
            .ignoresSafeArea()
            .onTapGesture {
                if (scriptNumber < appScripts.count - 1) {
                    self.scriptNumber += 1
                }
                if (self.scriptNumber == appScripts.count - 1) {
                    self.appearButton = true
                }
            }
    }
}
