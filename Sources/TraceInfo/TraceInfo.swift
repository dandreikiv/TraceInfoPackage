public struct TraceInfo: Codable {
    /// Channel/queue `index` to which `count` and `sequence` belong.
    ///
    /// A number between 0 and up to `maxConcurrent` parameter
    /// received during enrollment process.
    public let queueIndex: UInt

    /// TOTAL number of requests SENT.
    public private(set) var sent: UInt

    /// Number of SUCCEEDED requests (SUCCESSFUL responses RECEIVED).
    public private(set) var succeeded: UInt

    init(queueIndex: UInt, sent: UInt = 0, succeeded: UInt = 0) {
        self.queueIndex = queueIndex
        self.sent = sent
        self.succeeded = succeeded
    }
}

extension TraceInfo {
    public mutating func incrementSent() {
        sent += 1
    }

    public mutating func incrementSucceeded() {
        succeeded += 1
    }
}
