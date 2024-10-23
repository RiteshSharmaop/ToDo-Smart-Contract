// SPDX-License-Identifier: UNLICENSED
pregma solidity ^0.8.0;

contract todo {
    struct Todo {
        string text;
        bool isCompleted;
    }

    Todo[] public todos;
    mapping(address => todos) private Users;
    
    function addTask(string callback _task ) public {
        Users[msg.sender].push(Todo(_task , false;))
    }

    // solidity automatically create a getter for todos

    function get(uint index) public view returns(string memory text , bool isCompleted) {
        // returns to user
        Todo storage todo = todos.index;

        return (todo.text , todo.isCompleted); 

    }
}