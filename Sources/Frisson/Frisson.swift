#if canImport(AppKit)
import AppKit

@MainActor
public enum Frisson {
    public enum Pattern {
        case generic, alignment, levelChange

        fileprivate var native: NSHapticFeedbackManager.FeedbackPattern {
            switch self {
            case .generic: .generic
            case .alignment: .alignment
            case .levelChange: .levelChange
            }
        }
    }

    public static func play(_ pattern: Pattern) {
        NSHapticFeedbackManager.defaultPerformer.perform(
            pattern.native,
            performanceTime: .now
        )
    }
}
#endif
