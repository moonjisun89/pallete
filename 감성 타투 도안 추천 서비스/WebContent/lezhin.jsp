<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>타투 취향 월드컵</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="./lezhin.css?ver=2">
  </head>
  <body onload="preLoaingImg();">



    <!--[if lt IE 7]>
      <p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="#">upgrade your browser</a> to improve your experience.</p>
    <![endif]-->
    <div class="wrap">
      <header>
        <p id="roundTitle">당신의 취향에 딱맞는 타투를 찾아드립니다!<br />타투 취향 찾기에 참여해 주세요.</p>
      </header>

      
      <div class="content default" id="content">
        <button id="btnGameStart" onclick="start()">START!</button>
      </div>
      <footer class="footer soff" id="footer">
        <!--button id="prev" onclick="lezhin.Event.clickPrev()">◀ 이전선택</button>
        <button id="cancel" onclick="lezhin.Event.clickCancel()">✖ 그만하기</button-->
      </footer>
    </div>
    <script src="js/lezhin.js?ver=2" async defer></script>
    <script>
      function start() {
        lezhin.start();
      }
      function preLoaingImg() {
        const preLoadingList = [
          'images/01.jpg', 'images/02.jpg', 'images/03.jpg', 'images/04.jpg', 'images/05.jpg', 
          'images/06.jpg', 'images/07.jpg', 'images/08.jpg', 'images/09.jpg', 'images/10.jpg', 
          'images/11.jpg', 'images/12.jpg', 'images/13.jpg', 'images/14.jpg', 'images/15.jpg', 'images/16.jpg'
        ], length = preLoadingList.length, tObj = document.getElementsByTagName("BODY")[0];
        let i = 0, imgNode;
        const hiddenNode = document.createElement('DIV');
        hiddenNode.className = 'pre_load soff';
        for(i; i < length; i++) {
          imgNode = document.createElement('IMG');
          imgNode.setAttribute('src', preLoadingList[i]);
          hiddenNode.appendChild(imgNode);
        }
        tObj.appendChild(hiddenNode);
      }
    </script>
  </body>
