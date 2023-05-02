// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@opengsn/contracts/src/ERC2771Recipient.sol";

contract MyToken is ERC20,  ERC2771Recipient {

    constructor() ERC20("MyToken", "MTK") {
        _mint(msg.sender, 1000000 * (10 ** decimals()));
        _setTrustedForwarder(0xB2b5841DBeF766d4b521221732F9B618fCf34A87);

    }

    function _msgSender() internal view override(Context, ERC2771Recipient) returns (address) {
        return ERC2771Recipient._msgSender();
    }

    function _msgData() internal view override(Context, ERC2771Recipient) returns (bytes calldata) {
        return ERC2771Recipient._msgData();
    }

    function mint(uint256 amount) public {
        _mint(_msgSender(), amount);
    }


    function versionRecipient() external pure returns (string memory) {
        return "3.0.0-beta.3+opengsn.test-pea.ipaymaster";
    }
}
