pragma solidity ^0.4.11;

import "github.com/oraclize/ethereum-api/oraclizeAPI_0.4.sol";

contract RockPaperScissors_Game is usingOraclize{
    
    uint N = 7; // 我們希望數據源返回的隨機字節數
    uint delay = 0; // 執行發生前等待的秒數
    uint callbackGas = 200000; // 我們希望Oraclize為回調函數設置的gas量
    
    event newRandomNumber_uint(uint);
    uint new_random;
    string public banker_option;    //莊家出甚麼
    string public player_option;    //玩家出什麼
    string public strResult;        //結果是輸還是贏
    bool win = false;               //判斷是否贏
    
    constructor () public payable{
        oraclize_setProof(proofType_Ledger); // 在構造函數中設置Ledger真實性證明
    }
    
    
    function __callback(bytes32 _queryId, string _result, bytes _proof)public
    { 
        
        if (msg.sender != oraclize_cbAddress()) revert();
        
        if (oraclize_randomDS_proofVerify__returnCode(_queryId, _result, _proof) != 0) {
            revert();   //證明驗證失敗
        } else {
            uint maxRange = 3;
            uint randomNumber = uint(keccak256(abi.encodePacked(_result))) % maxRange+1; //1:剪刀 2:石頭 3:布
            new_random = randomNumber;
            //在[0，maxRange]範圍內獲取uint
            emit newRandomNumber_uint(randomNumber); 
        }
    }
    
    function play(uint your_op) public payable {
        require(msg.value == 0.1 ether);
        require(your_op==1 || your_op==2 || your_op==3);
        
        bytes32 queryId = oraclize_newRandomDSQuery(delay, N, callbackGas); 
        // 此函數在內部生成正確的oraclize_query並返回其queryId
        new_random = uint(queryId)%3+1;
        
        if(your_op==1)
            player_option="Scissors";
        else if(your_op==2)
            player_option="Rock";
        else if(your_op==3)
            player_option="Papper";
            
            
        if(new_random==1)
            banker_option="Scissors";
        else if(new_random==2)
            banker_option="Rock";
        else if(new_random==3)
            banker_option="Papper";
            
        Result(your_op,new_random);
        win = compareStr(strResult,"Win");
       if(win==true){
            msg.sender.transfer(0.2 ether);
        }
    }
    
    function Result(uint player, uint banker) returns (string result)
    {
        require(banker!=0);
        if (player == banker)
            strResult = "平手";
        else if((player==1)&&(banker==3)||(player==2&&banker==1)||(player==3&&banker==1)){
            strResult = "Win";
            win=true;
        }
        else 
            strResult = "Lose";
        
        return strResult;
    }
    
    function compareStr (string _str1, string _str2) public returns(bool checkResult) {
        if(keccak256(abi.encodePacked(_str1)) == keccak256(abi.encodePacked(_str2))) {
            // 如果二者相等，使checkResult為true
            checkResult = true;
        }else {
            checkResult = false;
        }
        // 返回checkResult
        return checkResult;
    }
}