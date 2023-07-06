// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

contract TaskContract {
    struct Task {
        string title;
        uint id;
        string description;
    }

    Task[] public tasks;

    uint nextTaskId = 0;

    function createTask(
        string memory _title,
        string memory _description
    ) public {
        tasks.push(
            Task({description: _description, id: nextTaskId++, title: _title})
        );
    }

    function getTasks(
        uint _taskId
    ) public view returns (string memory, uint, string memory) {
        uint index = findIndex(_taskId);

        return (tasks[index].description, tasks[index].id, tasks[index].title);
    }

    function findIndex(uint _id) internal view returns (uint) {
        for (uint i; i < tasks.length; i++) {
            if (tasks[i].id == _id) return i;
        }

        revert("Task not found");
    }

    function updateTask(
        uint _taskId,
        string memory _title,
        string memory _description
    ) public {
        uint index = findIndex(_taskId);

        tasks[index].title = _title;
        tasks[index].description = _description;
    }

    function deleteTask(uint _taskId) public {
        uint index = findIndex(_taskId);

        delete tasks[index];
    }
}
