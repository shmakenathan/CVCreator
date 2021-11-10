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
    }
}

