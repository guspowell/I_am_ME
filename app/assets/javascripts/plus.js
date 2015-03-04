var Plus = function () {

  var number = 0;

  Plus.prototype.defaultNumber = function() {
    return (number = 0);
  };

  Plus.prototype.increaseNumber = function() {
    return (number += 1);
  };

};