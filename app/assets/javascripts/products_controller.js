(function(){

  "use strict";

  angular.module("app").controller("productsCtrl", ["$scope", "$http", function($scope,$http) {

    $http.get("/products.json").then(function(response){
      $scope.products = response.data;
    });

    $scope.sortBy = function(attribute){
      if (attribute != $scope.orderAttribute){
        $scope.ascdesc = false;
      } else {
        $scope.ascdesc = !$scope.ascdesc;
      }
      $scope.orderAttribute = attribute;
    };

  }]);

}());