import XCTest
@testable import TraceInfo

final class TraceInfoTests: XCTestCase {
    private var sut: TraceInfoController!

    override func setUp() {
        super.setUp()
        sut = TraceInfoController()
    }

    func test_initialValues_forTraceInfo() async {
        // When
        let traceInfo = await sut.traceInfoAtQueue(index: 0)

        // Then
        XCTAssertEqual(traceInfo?.sent, 0)
        XCTAssertEqual(traceInfo?.succeeded, 0)
    }

    func test_controller_whenSendRequest_shouldIncrement() async {
        // When
        await sut.sendRequest(atQueue: 0)

        // Then
        let traceInfo = await sut.traceInfoAtQueue(index: 0)
        XCTAssertNotNil(traceInfo)
        XCTAssertEqual(traceInfo?.sent, 1)
    }

    func test_controller_whenReceivedSuccessResponse_shouldIncrement() async {
        // When
        await sut.receivedSuccessResponse(atQueue: 0)

        // Then
        let traceInfo = await sut.traceInfoAtQueue(index: 0)
        XCTAssertNotNil(traceInfo)
        XCTAssertEqual(traceInfo?.succeeded, 1)
    }
}
