import Foundation

public protocol TraceInfoControllerLogic {
    /// Increment the `sent` value of a `TraceInfo` object at queue with given index
    /// - Parameter index: index of a queue, where the `TraceInfo` stored
    func sendRequest(atQueue index: UInt) async
    
    /// Increment the `succeeded` value of a `TraceInfo` object at queue with given index
    /// - Parameter index: index of a queue, where the `TraceInfo` stored
    func receivedSuccessResponse(atQueue index: UInt) async
    
    /// Returns a `TraceInfo` object from queue with given index
    /// - Parameter index: index of the queue
    /// - Returns: TraceInfo object, if a queue with the given index exists, otherwise - nil
    func traceInfo(atQueue index: UInt) async -> TraceInfo?
}

public actor TraceInfoController {
    private var traceInfoQueues: [UInt: TraceInfo] = [:]

    public init(maxConcurrent: UInt = 10) {
        for index in 0..<maxConcurrent {
            traceInfoQueues[index] = TraceInfo(queueIndex: 0)
        }
    }
}

extension TraceInfoController: TraceInfoControllerLogic {
    public func sendRequest(atQueue index: UInt) async {
        traceInfoQueues[index]?.incrementSent()
    }

    public func receivedSuccessResponse(atQueue index: UInt) async {
        traceInfoQueues[index]?.incrementSucceeded()
    }

    public func traceInfo(atQueue index: UInt) async -> TraceInfo? {
        traceInfoQueues[index]
    }
}
