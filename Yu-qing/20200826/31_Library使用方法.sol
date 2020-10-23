pragma solidity ^0.4.24;
import "./SafeMath.sol";
contract class31{
    using SafeMath for uint;
    
    struct car{
        string color;
        uint price;
    }
    car x = car("yellow", 10);
    
    function carColor() public view returns(string, uint){
        return (x.color, x.price);
    }
    
    function use_add(uint a,uint b) public pure returns(uint){
        return a.add(b);
    }
    
    function myfuction (uint a)public pure returns(uint){
        return a.add(6);   // a + 6
    }
    
    function mufuction1 (uint aa, uint bb)public pure returns(uint){
        return aa.sub(bb);   // aa - bb
    }
    
}
