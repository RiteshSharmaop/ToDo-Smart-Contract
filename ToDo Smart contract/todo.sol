// SPDX-License-Identifier: UNLICENSED
pragma solidity >= 0.8.0;
// blog,marketplace , todo have similar concept

contract todo {
    struct Todo {
        string text;
        bool isCompleted;
    }

    Todo[] public todos;

    function create(string calldata _text) public {
        // three ways to init a struct
        // calling it like  function
        todos.push(Todo(_text , false));

        // key value mapping
        // todos.push(Todo({text:_text , isCompleted:false}));
        
        // init empty struct and update
        // Todo memory todo;
        // todo.text = _text;
        // todo.isCompleted = false;
        // todos.push(todo);
    }
    
    // solidity automatically create a getter for todos
    function get(uint _index) public view returns(string memory text , bool isCompleted) {
        // returns to user
        Todo storage todo = todos[_index];
        return (todo.text , todo.isCompleted); 
    }

     function getAllTask() public view returns(Todo[] memory) {
        return  todos;
     }
     
    //  update text
    function updateData(uint _index , string memory newText) public {
        todos[_index].text = newText;
    }

    // Task Done
    function taskDone(uint _index) public {
        // 1 way
        Todo storage todo = todos[_index];
        todo.isCompleted = true;

        // 2 way
        todos[_index].isCompleted = true;
    }

    function taskDoneHeading(string  memory _text) public {
        for(uint i = 0; i < todos.length ; ++i ){
            if(keccak256(abi.encodePacked(todos[i].text)) == keccak256(abi.encodePacked(_text))) 
                todos[i].isCompleted = true; 
                
        }
    }

    // togel isComplete trur-> false and  false->true
    function toggleCompleted(uint _index) public {
        todos[_index].isCompleted = !todos[_index].isCompleted; 
    }
}