pragma solidity ^0.4.0;
contract C {
    uint public constant x = 32**22 + 8;
    bytes32 public constant myHash = keccak256("abc");
  
    uint time = 5;
    
    constructor() public {
        //x = 3;
    }
    
    function getTime() public view returns(uint){
        if(time <= 86400 && time >= 0)
         return time;
        else
         return 0;
    }    
    function setTime(uint32 key) public {
        if(time + key >= 86400)
            time = 86400;
        else
            time = time + key;
    }
}