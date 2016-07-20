(function(){

  "use strict";

  angular.module("app").controller("productsCtrl", ["$scope", "$http", function($scope,$http) {

    $http.get("/products.json").then(function(response){
      $scope.products = response.data;
    });

    $scope.limit = 8;
    $scope.loadMore = function() {
      $scope.limit += 8;
    }

    $scope.sortBy = function(attribute){
      $scope.limit = $scope.products.length;
      if (attribute != $scope.orderAttribute){
        $scope.ascdesc = false;
      } else {
        $scope.ascdesc = !$scope.ascdesc;
      }
      $scope.orderAttribute = attribute;
    };

    $scope.sortNew = function(attribute){
      $scope.limit = $scope.products.length;
      if (attribute = $scope.orderAttribute){
        $scope.ascdesc = false;
      } else {
        $scope.ascdesc = !$scope.ascdesc;
      }
      $scope.orderAttribute = attribute;
    };

    $scope.showAll = function(){
      $scope.limit = $scope.products.length;
    };

  }]);

}());