// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;


contract ErrorHandlingContract {
    
    address public owner = msg.sender;
    uint public age = 30;


    // This is an example of require()
    function checkRequire(uint x) public{
        require(x!=0,"Age must be greater than 0");
        age += x;
    }

    function getAge() public view returns (uint){
        return age;
    }


    // This is a customize error for revert
    error throwError(string,address);

    // This is a function of revert()
    function checkRevert(uint x) public{
        age += x;
        if(x<=0){
            revert throwError("Value should be greater than 0. Transaction is set to its initial state.",msg.sender);
            // revert("Value should be > 0");
        }
    }

    // This is the function which describes use of assert
    function checkOwner() public view{
        assert(owner==0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);
    }

    
    
}
