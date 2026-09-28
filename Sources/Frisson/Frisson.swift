import AppKit

public enum Frisson {
    public static func play(
        _ pattern: NSHapticFeedbackManager.FeedbackPattern
    ) {
        NSHapticFeedbackManager.defaultPerformer.perform(
            pattern,
            performanceTime: .now
        )
    }
}
