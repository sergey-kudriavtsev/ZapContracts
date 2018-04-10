pragma solidity ^0.4.17;

/*
THIS IS AN EARLY EXPERIMENTAL DEMONSTRATION. DO NOT USE WITH REAL ETHER.
*/
import "../dispatch/DispatchInterface.sol";
import "../bondage/BondageInterface.sol";
import "../lib/ERC20.sol";


contract TestSubscriber {

    // string public response1;
    // bytes32 public specifier = "spec01";

    event Result1(string response1);
    event Result2(string response1, string response2);
    event Result3(string response1, string response2, string response3);
    event Result4(string response1, string response2, string response3, string response4);

    DispatchInterface dispatch;
    BondageInterface bondage;
    ERC20 token;

    function TestSubscriber(address dispatchAddress, address bondageAddress, address tokenAddress) public {
        dispatch = DispatchInterface(dispatchAddress);
        bondage = BondageInterface(bondageAddress);
        token = ERC20(tokenAddress);
    }

    /*
    HANDLE PROVIDERS RESPONSE HERE: house_passage ("true" or "false")
    */
    function callback(uint256 id, string _response1) public {
        emit Result1(_response1);
    }

    /*
    HANDLE PROVIDERS RESPONSE HERE: house_passage ("true" or "false")
    */
    function callback(uint256 id, string _response1, string _response2) public {
        emit Result2(_response1, _response2);
    }

    /*
    HANDLE PROVIDERS RESPONSE HERE: house_passage ("true" or "false")
    */
    function callback(uint256 id, string _response1, string _response2, string _response3) public {
        emit Result3(_response1, _response2, _response3);
    }

    /*
    HANDLE PROVIDERS RESPONSE HERE: house_passage ("true" or "false")
    */
    function callback(uint256 id, string _response1, string _response2, string _response3, string _response4) public {
        emit Result4(_response1, _response2, _response3, _response4);
    }

    function bondToOracle(address provider, bytes32 specifier, uint256 numZap) public {
        uint256 bondageDecimals = 10 ** token.decimals();
        token.approve(bondage, numZap * bondageDecimals);
        bondage.bond(provider, specifier, numZap);
    }

    function queryTest(
        address provider,
        string query,
        bytes32 endpoint,
        bytes32[] endpointParams
        ) 
        public returns(uint256)
    {
        uint256 id = dispatch.query(provider, query, endpoint, endpointParams);
        return id;
    }
}

