(function(){

  "use strict";

  angular.module("app").controller("productsCtrl", function($scope,$http) {

    $http.get("/products.json").then(function(response){
      $scope.products = response.data;
    });

  });

}());