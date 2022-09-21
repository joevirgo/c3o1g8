<%-- 
    Document   : Clientes
    Created on : 13/09/2022, 06:38:11 AM
    Author     : JORGE EDUARDO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
        <title>JSP Page</title>
        
    </head>
    <body>
        <div class="container-fluid" ng-app="clientes" ng-controller="clientesController as a">

            <div class="row">
                <div class="col-12">
                    <h4>Formulario</h4>

                    <div class="row">
                        <div class="col-2">
                            <label >Id Usuario:</label>
                            <input  type="text" class="form-control" ng-model="a.idUsuario" placeholder="para eliminar y actualizar" >
                        </div>
                        <div class="col-4">
                            <label >Nombre:</label>
                            <input type="text" class="form-control" ng-model="a.nombre">
                        </div>
                        <div class="col-6">
                            <label >Correo electronico:</label>
                            <input type="text" class="form-control" ng-model="a.email">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-4">
                            <label >Telefono:</label>
                            <input type="text" class="form-control" ng-model="a.telefono">
                        </div>
                        <div class="col-4">
                            <label >Ciudad:</label>
                            <input type="text" class="form-control" ng-model="a.ciudad">
                        </div>
                        <div class="col-4">
                            <label >Departamento:</label>
                            <input type="text" class="form-control" ng-model="a.departamento">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-3">
                            <label >Direccion:</label>
                            <input type="text" class="form-control" ng-model="a.direccion">
                        </div>
                        <div class="col-3">
                            <label >Barrio:</label>
                            <input type="text" class="form-control" ng-model="a.barrio">
                        </div>
                        <div class="col-6">
                            <label >Indicaciones adicionales:</label>
                            <input type="text" class="form-control" ng-model="a.indicacionAdicional">
                        </div>
                    </div>
                    <div class="row">
                        
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-3">
                            <button type="button" class="btn btn-outline-secondary" ng-click="a.guardar()">Guardar</button>
                        </div>
                        <div class="col-3">
                            <button type="button" class="btn btn-outline-dark" ng-click="a.consultar()">Consultar</button>
                        </div>
                        <div class="col-3">
                            <button type="button" class="btn btn-outline-secondary" ng-click="a.actualizar()">Actualizar</button>
                        </div>
                        <div class="col-3">
                            <button type="button" class="btn btn-outline-warning" ng-click="a.eliminar()">Eliminar</button>
                        </div>
                    </div>
                </div>
            </div>
            <br>
            <br>
            <div class="row">
                <div class="col-12">
                    <h4>Tabla - Clientes</h4>
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>                                
                                <th scope="col">Id Usuario</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">Email</th>
                                <th scope="col">Telefono</th>
                                <th scope="col">Ciudad</th>
                                <th scope="col">Departamento</th>
                                <th scope="col">Direccion</th>
                                <th scope="col">Barrio</th>
                                <th scope="col">Indicaciones adicionales</th>
                                
                            </tr>
                        </thead>
                        <tbody>
                            <tr ng-repeat="ax in a.clientes">                               
                                <td>{{ax.idUsuario}}</td>
                                <td>{{ax.nombre}}</td>
                                <td>{{ax.email}}</td>
                                <td>{{ax.telefono}}</td>
                                <td>{{ax.ciudad}}</td>
                                <td>{{ax.departamento}}</td>
                                <td>{{ax.direccion}}</td>
                                <td>{{ax.barrio}}</td>
                                <td>{{ax.indicacionAdicional}}</td>
                            </tr>
                            
                        </tbody>
                    </table>
<!--                {{a.idUsuario}}
                    {{a.nombre}}
                    {{a.email}}-->
                </div>
            </div>
        </div>
        <script>
            var app=angular.module('clientes',[]);
            app.controller('clientesController',['$http',controladorClientes]);
            function controladorClientes($http){
                var a=this;
                
                a.consultar=function(){
                    
                    var parametros={
                        proceso:'listar'
                    };
                    $http({
                        method:'POST',
                        url:'peticionesCliente.jsp',
                        params:parametros
                    }).then(function(resp){
                        a.clientes=resp.data.clientes;
                        
                    });
                };
                
                a.guardar=function(){
                    var parametros={
                        proceso:'guardar',
                      
                        nombre:a.nombre,
                        email:a.email,
                        telefono:a.telefono,
                        ciudad:a.ciudad,
                        departamento:a.departamento,
                        direccion:a.direccion,
                        barrio:a.barrio,
                        indicacionAdicional:a.indicacionAdicional
                    };
                    $http({
                        method:'POST',
                        url:'peticionesCliente.jsp',
                        params:parametros
                    }).then(function(resp){
                        if(resp.data.ok===true){
                            if(resp.data.guardar===true){
                                alert('Guardó');
                            }else{
                                alert('No Guardó');
                            }
                            
                        }else{
                            alert(resp.data.errorMsg);
                        }
                    });
                };
                a.actualizar=function(){
                    var parametros={
                        proceso:'actualizar',
                        idUsuario:a.idUsuario,
                        nombre:a.nombre,
                        email:a.email,
                        telefono:a.telefono,
                        ciudad:a.ciudad,
                        departamento:a.departamento,
                        direccion:a.direccion,
                        barrio:a.barrio,
                        indicacionAdicional:a.indicacionAdicional
                    };
                    $http({
                        method:'POST',
                        url:'peticionesCliente.jsp',
                        params:parametros
                    }).then(function(resp){
                        if(resp.data.ok===true){
                            if(resp.data.actualizar===true){
                                alert('Actualizó');
                            }else{
                                alert('No Actualizó');
                            }
                            
                        }else{
                            alert(resp.data.errorMsg);
                        }
                    });
                };
                a.eliminar=function(){
                     var parametros={
                        proceso:'eliminar',
                        idUsuario:a.idUsuario
                    };
                    $http({
                        method:'POST',
                        url:'peticionesCliente.jsp',
                        params:parametros
                    }).then(function(resp){
                        if(resp.data.ok===true){
                            if(resp.data.eliminar===true){
                                alert('Eliminó');
                            }else{
                                alert('No Eliminó');
                            }
                            
                        }else{
                            alert(resp.data.errorMsg);
                        }
                    });
                };
            }
        </script>

    </body>
</html>

                  