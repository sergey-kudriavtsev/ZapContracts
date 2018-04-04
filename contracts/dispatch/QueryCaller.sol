pragma solidity ^0.4.21;
// v1.0

import "./Dispatch.sol";


/**
 * CONTRACT FOR TESTS !!!
 */
contract QueryCaller { 

    address public dispatch;
    uint256 public id;

    function QueryCaller(address _dispatch) public {
        dispatch = _dispatch;
    }

    function calculateId( 
        uint256 blockNumber,
        uint256 time,        
        string userQuery      
    ) public returns (uint256) {
        id = uint256(keccak256(blockNumber, now, userQuery, msg.sender));
        return id;
    }
  
}
