struct TraceInfo: Codable {
    /// Channel/queue `index` to which `count` and `sequence` belong.
    ///
    /// A number between 0 and up to `maxConcurrent` parameter
    /// received during enrollment process.
    let queueIndex: UInt

    /// TOTAL number of requests SENT.
    var sent: UInt

    /// Number of SUCCEEDED requests (SUCCESSFUL responses RECEIVED).
    var succeeded: UInt

    init(queueIndex: UInt, sent: UInt = 0, succeeded: UInt = 0) {
        self.queueIndex = queueIndex
        self.sent = sent
        self.succeeded = succeeded
    }
}
