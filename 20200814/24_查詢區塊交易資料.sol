pragma solidity ^0.4.24;

contract class24{
    
    function get_time_now()public view returns(uint256,uint256){
        return (now,block.timestamp);
    }
    function get_block_info()public view returns(uint blockNumber,bytes32 blockHash,uint256  blockDifficulty){
        //只能拿到256個區塊內的hash
        return (block.number,
                blockhash(block.number-1),
                block.difficulty);
    }
    function get_tx_info()public view returns(address msgSender,address origin,uint value){
        return (msg.sender,
                tx.origin,
                msg.value);
    }
    
    //實作記錄送過來的ether
    
    //event setMoney(uint money);
    uint public value;
    address  public who;
    uint public blockheight;
    uint rightnow;
    
     function buy() public payable{
        //emit setMoney(msg.value);
        value=msg.value;
        who=msg.sender;
        blockheight=block.number;
        rightnow=now;
    }
}




// 8-14作業
// pragma solidity ^0.4.24;

// contract data {
//     uint public value;
//     uint public time;
//     uint public blockNumber;
//     bytes32 public blockParentHash;
//     address public senderAdress;
//     address public minerAdress;
//     uint public blockDifficulty;
//     uint public gasPrice;
    
//     function transaction() public payable{
//         value=msg.value;                    //發送wei數量
//         time = block.timestamp;             //區塊時間戳
//         blockNumber = block.number;         //目前區塊編號
//         blockParentHash = blockhash(blockNumber - 1); //目前區塊的Parent_Hash值
//         senderAdress=msg.sender;            //發送者地址
//         minerAdress = block.coinbase;       //礦工地址
//         blockDifficulty = block.difficulty; //區塊難度
//         gasPrice = tx.gasprice;             //gas價格
//     }
// }