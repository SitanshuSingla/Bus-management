var app = angular
        .module("myModule", [])
        .controller("myController", function ($scope) {

            var employees = [
                { sno: "1", routeno: "100", route: "Manimajra", bus: "3569" ,driver: "Raman",contact: "7485963256",timing: "7.30 AM" },
                { sno: "2", routeno: "101", route: "Panchkula", bus: "9658" ,driver: "Chandan",contact: "8696963256",timing: "7.50 AM" },
            { sno: "3", routeno: "103", route: "Sector 45", bus: "001" ,driver: "Sidhu",contact: "8365963256",timing: "7.30 AM" }
            ];

            $scope.employees = employees;
        });
        
        
        
        