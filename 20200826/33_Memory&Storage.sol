pragma solidity ^0.4.24;
contract class33{
    //函數外面的參數，默認為storage
   uint x;
   uint y = 10;
       
    struct fruit{
        uint id;
        string name;
   }
    
   mapping(address => fruit) public fruitmap;
   
   function mapex(uint i,string n)public{
       fruit storage fruit1 = fruitmap[0x240BE7b2f9e9CA5073ec3c3A108bf3147670A759];
       fruit1.id = i;
       fruit1.name = n;
   }
    
   fruit[12] public fruitarray;
   function example1(uint i,string n)public{
        fruit storage fruit1 = fruitarray[0];
        fruit1.id = i;
        fruit1.name = n;
        
        
    }
    
    function example2(uint i,string n)public view{
        //不會改變鏈上資訊
        fruit memory fruit1 = fruitarray[0];
        fruit1.id = i;
        fruit1.name = n;
    }
}