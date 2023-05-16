// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract FoodOrdering {
    
    struct Order {
        string foodName;
        uint quantity;
        uint price;
        address payable customer;
        bool paid;
        bool delivered;
    }
    
    Order[] public orders;
    mapping(uint => bool) public orderStatus;
    
    event OrderPlaced(uint orderId, address customer);
    event OrderPaid(uint orderId, address customer);
    event OrderDelivered(uint orderId, address customer);
    
    function placeOrder(string memory _foodName, uint _quantity, uint _price) public {
        Order memory newOrder = Order({
            foodName: _foodName,
            quantity: _quantity,
            price: _price,
            customer: payable(msg.sender),
            paid: false,
            delivered: false
        });
        uint orderId = orders.length;
        orders.push(newOrder);
        emit OrderPlaced(orderId, msg.sender);
    }
    
}
