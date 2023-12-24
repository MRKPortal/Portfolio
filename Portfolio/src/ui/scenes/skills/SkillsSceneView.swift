//Generated by MRKPortal Yggdrasil

import SwiftUI

struct SkillSelection: IdentifiableEquatable {
    let start: CGPoint
    let skill: SkillEntity
}

struct SkillsSceneView<P: SkillsScenePresenterProtocol>: View {

    private let generator = UIImpactFeedbackGenerator(style: .light)

    @ObservedObject private var presenter: P
    
    @State private var animateDetail: Bool = false
    @State private var selected: SkillSelection?

    init(_ presenter: P) {
        self.presenter = presenter
    }
    
    var body: some View {
        ZStack {
            GeometryReader { reader in
                HiveView { index, pos in
                    let skill = presenter.skills[secured: index]
                    SkillCellView(skill)
                        .frame(size: .s(reader.size.width/2))
                        .scaleEffect(2/3)
                        .opacity(selected != nil && selected?.skill == skill ? 0 : 1)
                        .onTapGesture {
                            if let skill {
                                generator.impactOccurred()
                                selected = SkillSelection(
                                    start: pos * (reader.size.width/3),
                                    skill: skill
                                )
                            }
                        }
                }
                .allowsHitTesting(selected == nil)
                .gestureRouter(directions: [.right, .left]) { direction in
                    switch direction {
                    case .right:
                        presenter.pop()
                    default:
                        presenter.displayNext()
                    }
                }
            }
            
            SkillDetailView(selection: $selected)
        }
    }
}
