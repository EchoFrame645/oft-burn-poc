// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./OFTCore.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract OFT is OFTCore, ERC20 {
    constructor(string memory name, string memory symbol, address lzEndpoint)
        ERC20(name, symbol)
        OFTCore(lzEndpoint)
    {
        _mint(msg.sender, 1_000_000 ether); // initial mint for testing
    }

    function _debitFrom(address from, uint16, bytes memory, uint amount)
        internal override returns (uint)
    {
        _burn(from, amount);
        return amount;
    }

    function _creditTo(uint16, address to, uint amount)
        internal override returns (uint)
    {
        _mint(to, amount);
        return amount;
    }
}
