<!-- <@ page contentType="text/html;charset=UTF-8" language="java" %> -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
    <head>
        <title>HomePage</title>
        <%--<link rel="stylesheet" type="text/css" href="../../img/style.css"/>--%>
    </head>

    <body>
    <style>
        /* reset default settings Chrome*/
        body{
            margin:0;
        }
        form{
            margin:0;
        }
        /* end reset Chrome default setting*/
    
        /* DESKTOP SETTINGS*/
        @media (min-width: 1024px) {
            body{
                background-color: #9bcaff
            }
        
            div{
                width: 100%;
                box-sizing: border-box;
            }
        
            p{
                margin: 0px;
                height:24px;
                margin: 15px;
                text-align: left;
                font-size: 24px;
            }
        
        
        
        
            /*-------------- HEADER -------------*/
            #header{
                display: grid;
                position: fixed;
                grid-template-columns: 2fr 1fr;
            }
        
            #title{
                background-color: #8592f5;
            }
                #databaseImage{
                    padding:3px;
                    display:inline;
                }
                #pageName{
                    font-style: italic;
                    height: 50px;
                    display:inline;
                    vertical-align: top;
            }
        
            #search{
                text-align: right;
                background-color: #c1eeff;
            }
                #searchText{
                    margin:15px;
                    margin-right: 0;
                    vertical-align: top;
                    height:24px;
                }
                #searchImage{
                    margin:15px;
                    margin-left:3px;
                }
        
        
        
        
            /*-------------- BODY -------------*/
            #body1{
                display:grid;
                padding-top: 58px;
                grid-template-columns: 20% 60% 20%;
                grid-template-rows: 20px 500px;
            }
            #reset{
                cursor: pointer;
            }
        
            #resetButton{
                text-align: center;
            
            }
        
            #showData{
                padding-left: 30%;
                padding-right: 30%;
                padding-top: 20px;
            }
        
        
        
            /*-------------- FOOTER -------------*/
            #footer{
            
                position:fixed;
                bottom:0;
            }
        
            p#footerData{
                text-align:center;
            }
        }
    
        /* ------------ RETURN TO TOP SETTINGS ---------------
        #return-to-top {
            position: fixed;
            bottom: 20px;
            right: 20px;
            background: rgb(0, 0, 0);
            background: rgba(0, 0, 0, 0.7);
            width: 50px;
            height: 50px;
            display: block;
            text-decoration: none;
            -webkit-border-radius: 35px;
            -moz-border-radius: 35px;
            border-radius: 35px;
            display: none;
            -webkit-transition: all 0.3s linear;
            -moz-transition: all 0.3s ease;
            -ms-transition: all 0.3s ease;
            -o-transition: all 0.3s ease;
            transition: all 0.3s ease;
        }
        #return-to-top i {
            color: #fff;
            margin: 0;
            position: relative;
            left: 16px;
            top: 13px;
            font-size: 19px;
            -webkit-transition: all 0.3s ease;
            -moz-transition: all 0.3s ease;
            -ms-transition: all 0.3s ease;
            -o-transition: all 0.3s ease;
            transition: all 0.3s ease;
        }
        #return-to-top:hover {
            background: rgba(0, 0, 0, 0.9);
        }
        #return-to-top:hover i {
            color: #fff;
            top: 5px;
            
        $(window).scroll(function() {
            if ($(this).scrollTop() >= 50) {        // If page is scrolled more than 50px
                $('#return-to-top').fadeIn(200);    // Fade in the arrow
            } else {
                $('#return-to-top').fadeOut(200);   // Else fade out the arrow
            }
        });
        $('#return-to-top').click(function() {      // When arrow is clicked
            $('body,html').animate({
                scrollTop : 0                       // Scroll to top of body
            }, 500);
        });
        }*/
    
        /* MOBILE SETTINGS*/
        @media (max-width: 1023px) {
            body{
                background-color: #00a4ff;
            }
        }
    </style>


    <div id = "header">
        <div id = "title">
            <%--<img id="databaseImage" src="img/database48.png">--%>
            <p id="pageName">DATABASE STUDENTI</p>
        </div>
        <div id = "search">
            <form method="GET" action="/index/filter">
                <input id="searchText" type="text" name="name" autocomplete="off">
                <%--<input id="searchImage" type="image" src="../../img/magnifier.png">--%>
            </form>
        </div>
    </div>


    <div id = "body1">
        <c:if test="${filtered}">
            <c:set var="showButton" value="show"/>
        </c:if>
        <div id = "resetButton">
            <button id = "reset" class = "reset ${showButton}" href = "/index/all">Reset filter</button>
        </div>
        <div></div>
        <div></div>
        <div id="showData">
            <table>
                <tr>
                    <td>Id</td>
                    <td>Nome</td>
                    <td>Cognome</td>
                </tr>
                <c:forEach items="${lista}" var="student">
                    <tr>
                        <td> ${student.id} </td>
                        <td> ${student.firstname} </td>
                        <td> ${student.lastname} </td>
                        <td><a href="/index/modify?id=${student.id}">Modify</a></td>
                        <%--<td><button id="modify" onclick="window.location=/index/modify?id=${student.id}")>Modify</button></td>--%>
                        
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>




    <div id="footer">
        <p id="footerData">Daniele Rendina - Sopra Steria</p>
        <!--
        <a href="/index/all"> <img border="0" alt="Return to Top" src="img/arrow-top.png" width="48" height="48"> </a>
        -->

    </div>

    </body>
</html>
