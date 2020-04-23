pragma solidity >=0.4.22 <0.7.0;

contract crowFundingejercicio1{
    
    // VARIABLES:
    // strings, int, uint, booleanos, address, blockhash
    //public, private, internal, external
    
    address private owner;
    
    constructor() public {
        
        owner = msg.sender;
    }
    
    modifier isOwner() {
        
        require(owner == msg.sender);
        _;
    }
    
    
    
    string public nombre;
    string public apellido;
    
    uint public objetivo = 10 ether;
    uint public balance;
    uint public totalRecaudado;
    
    address payable public artista = 0xdD870fA1b7C4700F2BD7f44238821C26f7392148;
    
    function setColaboradores(string memory nombre_colaborador, string memory apellido_colaborador) public isOwner payable {
        
        nombre = nombre_colaborador;
        apellido = apellido_colaborador;
        
        require(msg.value > 1 ether);
        
        balance = balance + msg.value;
        
        if(balance >= objetivo) {
            
            payOut();
            
        }
    }
    
    function getColaborador() public view returns (string memory, string memory){
    
        return(nombre, apellido);
    
    }

    function payOut() private {
    
        totalRecaudado = balance;
        balance = 0;
    
        artista.transfer(totalRecaudado);
    
    }
}