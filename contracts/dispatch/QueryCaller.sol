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

    function callQuery(
        address provider,         
        string userQuery,          
        bytes32 endpoint,          
        bytes32[] endpointParams  
    ) public returns (uint256) {
        Dispatch d = Dispatch(dispatch);
        uint256 tmp = d._query(provider, userQuery, endpoint, endpointParams, msg.sender);
        id = tmp;
        return id;
    }
  
}
