//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "./interface.sol";

import "hardhat/console.sol";

contract main {

    function depositWithPermit(address _asset,address _owner, uint256 _amount, uint256 _deadline, uint8 v, bytes32 r, bytes32 s) external {

        ERC20_functions token = ERC20_functions(_asset);

        token.permit(_owner, address(this), _amount, _deadline, v, r, s);

        token.transferFrom(_owner, address(this), _amount);

    }

}
