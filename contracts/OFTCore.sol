// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

abstract contract OFTCore {
    address public lzEndpoint;

    constructor(address _lzEndpoint) {
        lzEndpoint = _lzEndpoint;
    }

    function sendFrom(
        address from,
        uint16 dstChainId,
        bytes calldata toAddress,
        uint amount,
        address payable, // refundAddress
        address,         // zroPaymentAddress
        bytes calldata   // adapterParams
    ) public payable virtual {
        _send(from, dstChainId, toAddress, amount);
    }

    function _send(
        address from,
        uint16 dstChainId,
        bytes memory toAddress,
        uint amount
    ) internal {
        _debitFrom(from, dstChainId, toAddress, amount);
        // delivery intentionally skipped → simulating message failure
    }

    function _debitFrom(address, uint16, bytes memory, uint) internal virtual returns (uint);
    function _creditTo(uint16, address, uint) internal virtual returns (uint);
}
