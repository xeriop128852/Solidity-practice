pragma solidity ^0.4.24;

contract Factory {
    address[] public newContracts;

    function createContract(string name) public {
        address newContract = new Contract(name);
        newContracts.push(newContract);
    } 
}

contract Contract {
    string public Name;
    constructor (string _name) public {
        Name = _name;
    }
    function setName(string _name) public {
        Name = _name;
    }
}
contract interaction {
    Contract contract_ = Contract(0x682f5F1487e92F7c718CeCe96bB26Ef95794AA0b); 
    function setSomething(string _name) public {
        contract_.setName(_name);
    }
}


