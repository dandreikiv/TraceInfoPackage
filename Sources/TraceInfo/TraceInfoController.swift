import Foundation

public protocol TraceInfoControllerLogic {
    func sendRequest(atQueue index: UInt) async
    func receivedSuccessResponse(atQueue index: UInt) async
    func traceInfoAtQueue(index: UInt) async -> TraceInfo?
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

    public func traceInfoAtQueue(index: UInt) async -> TraceInfo? {
        traceInfoQueues[index]
    }
}
