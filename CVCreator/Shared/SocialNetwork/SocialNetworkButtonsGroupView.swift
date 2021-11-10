import SwiftUI
import CVCreatorCore


struct SocialNetworkButtonsGroupView: View {
    @ObservedObject var viewModel: SocialNetworkButtonsGroupViewModel
    
    var body: some View {
        HStack(spacing: 30.0) {
            ForEach(viewModel.socialNetworkButtonViewModels) {
                SocialNetworkButtonView(viewModel: $0)
            }
            
        }
    }
}


