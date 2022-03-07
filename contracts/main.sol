//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "./interface.sol";

import "hardhat/console.sol";

contract main {

    function depositWithPermit(address _asset,address _owner, uint256 nonce, uint256 _amount, uint256 _deadline, uint8 v, bytes32 r, bytes32 s) external {
        
        if(_asset==0x6B175474E89094C44Da98b954EedeAC495271d0F){
            ERC20_dai_functions token = ERC20_dai_functions(_asset);

            token.permit(_owner, address(this), nonce, _deadline, true, v, r, s);

            token.transferFrom(_owner, address(this), _amount);
        }
        else{
            ERC20_functions token = ERC20_functions(_asset);

            token.permit(_owner, address(this), _amount, _deadline, v, r, s);

            token.transferFrom(_owner, address(this), _amount);
        }

    }

}
