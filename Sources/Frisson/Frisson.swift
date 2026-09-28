#if canImport(AppKit)
import AppKit

@MainActor
public enum Frisson {
    public enum Pattern {
        case generic
        case alignment
        case levelChange

        var feedback: NSHapticFeedbackManager.FeedbackPattern {
            switch self {
            case .generic: return .generic
            case .alignment: return .alignment
            case .levelChange: return .levelChange
            }
        }
    }

    public static func play(_ pattern: Pattern = .generic, delay: TimeInterval = 0) {
        guard delay > 0 else {
            fire(pattern)
            return
        }

        Task { @MainActor in
            try? await Task.sleep(nanoseconds: UInt64(delay * 1_000_000_000))
            fire(pattern)
        }
    }

    private static func fire(_ pattern: Pattern) {
        NSHapticFeedbackManager.defaultPerformer.perform(
            pattern.feedback,
            performanceTime: .now
        )
    }
}
#endif
