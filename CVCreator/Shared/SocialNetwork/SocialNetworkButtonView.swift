import SwiftUI
import CVCreatorCore

struct SocialNetworkButtonView: View {
   @ObservedObject var viewModel: SocialNetworkButtonViewModel
    
    var body: some View {
        Button {
          viewModel.didTapOnButton(viewModel.socialNetwork)
        } label: {
            Image(viewModel.socialNetwork.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .padding(20)
        .frame(width: 85,height: 60)
        .background(viewModel.socialNetwork.color)
        .cornerRadius(20).shadow(color: .gray, radius: 2, x: 0, y: 2)
        
    }
}

