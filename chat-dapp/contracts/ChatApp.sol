// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ChatApp {
    struct Message {
        address from;
        address to;
        string content;
        uint timestamp;
    }

    Message[] public messages;

    event MessageSent(address indexed from, address indexed to, string content, uint timestamp);

    function sendMessage(address _to, string memory _content) public {
        messages.push(Message(msg.sender, _to, _content, block.timestamp));
        emit MessageSent(msg.sender, _to, _content, block.timestamp);
    }

    function getMessages(address user1, address user2) public view returns (Message[] memory) {
        uint count;
        for (uint i = 0; i < messages.length; i++) {
            if (
                (messages[i].from == user1 && messages[i].to == user2) ||
                (messages[i].from == user2 && messages[i].to == user1)
            ) {
                count++;
            }
        }

        Message[] memory result = new Message[](count);
        uint index;

        for (uint i = 0; i < messages.length; i++) {
            if (
                (messages[i].from == user1 && messages[i].to == user2) ||
                (messages[i].from == user2 && messages[i].to == user1)
            ) {
                result[index] = messages[i];
                index++;
            }
        }

        return result;
    }
}
