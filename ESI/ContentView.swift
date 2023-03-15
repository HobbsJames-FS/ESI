import SwiftUI
import SafariServices
import MessageUI

struct ContentView: View {
   
    @State private var showSafariView = false
    @State private var selectedURL: URL? = nil
    @State private var isMailViewPresented = false
    
    var body: some View {
        let buttonLinks: [(title: String, imageName: String, action: () -> Void)] = [
            ("Time Keeping", "time", { self.openURL("https://my.timerack365.com/TimeRack/") }),
            ("Forms", "forms", { self.openURL("https://app.workbright.com/users/sign_in") }),
            ("Benefits", "benefits", { self.openURL("https://www.mybentek.com/esi/") }),
            ("401K", "401k", { self.openURL("https://www.ps.jhancockpensions.com/do/home/homePageFinder/") }),
            ("Pay Schedule", "payschedule", { self.openURL("https://www.example5.com") }),
            ("Pay Stubs \n   & W2", "paystubs", { self.openURL("https://eps.aviontego.com/portals/login.aspx?CompanyID=EPS") }),
            ("Call us", "phone", { ContentView.callPhoneNumber("(888)-246-6066") }),
            ("Email us", "email", { self.sendEmail() }),
            ("Feedback", "feedback", { self.openURL("https://www.example9.com") })
        ]
        
   NavigationView {
        ZStack {
            // Set the background image
            Image("background4")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .blur(radius: 0)

            VStack {
                Text("\nWelcome \n  to ESI")
                    .font(Font.custom("Roboto-Thin", size: 43))
                    .foregroundColor(.white)
                    .shadow(color: .black.opacity(0.7), radius: 5, x: 0, y: 3)

                Spacer()

                LazyVGrid(columns: Array(repeating: .init(.flexible(), spacing: 20), count: 3), spacing: 20) {
                    ForEach(buttonLinks.indices, id: \.self) { index in
                        VStack {
                            Button(action: {
                                buttonLinks[index].action()
                            }) {
                                Image(buttonLinks[index].imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .background(LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.8), Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing))
                                    .cornerRadius(20)
                                    .shadow(color: Color.black.opacity(0.3), radius: 5, x: 3, y: 3)
                            }
                            Text(buttonLinks[index].title)
                                .foregroundColor(.white)
                                .shadow(color: Color.black.opacity(1.0), radius: 5, x: 3, y: 3)
                        }
                    }
                }
                .padding()

                Spacer()
            }
            .navigationTitle("")
            .navigationBarHidden(true)
            .sheet(isPresented: $showSafariView) {
                if let url = selectedURL {
                    SafariView(url: url)
                }
            }
            .sheet(isPresented: $isMailViewPresented) {
                MailView()
            }
        }
    }


    }
    
    func openURL(_ urlString: String) {
        if let url = URL(string: urlString) {
            selectedURL = url
            showSafariView = true
        }
    }
    
    static func callPhoneNumber(_ phoneNumber: String) {
        if let url = URL(string: "tel:\(888-246-6066)") {
            UIApplication.shared.open(url)
        }
    }
    
    func sendEmail() {
        isMailViewPresented = true
    }
}

struct SafariView: UIViewControllerRepresentable {
    let url: URL
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        let config = SFSafariViewController.Configuration()
        config.entersReaderIfAvailable = false
        let safariVC = SFSafariViewController(url: url, configuration: config)
        return safariVC
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {
        
    }
}

struct MailView: UIViewControllerRepresentable {
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> MFMailComposeViewController {
        let mail = MFMailComposeViewController()
        mail.setToRecipients(["hr@esiworks.com"])
        mail.setSubject("I need some help")
        mail.setMessageBody("", isHTML: false)
        mail.mailComposeDelegate = context.coordinator
        return mail
    }
    
    func updateUIViewController(_ uiViewController: MFMailComposeViewController, context: Context) {
    }

    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        let parent: MailView

        init(_ parent: MailView) {
            self.parent = parent
        }

        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
            controller.dismiss(animated: true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
