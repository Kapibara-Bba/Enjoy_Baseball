// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require underscore
//= require gmaps/google
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require rails-ujs
//= require activestorage
//= require turbolinks

//= require_tree .

document.addEventListener("turbolinks:load", function() {
  $(function() {
    $('#back a').on('click',function(event){
      $('body, html').animate({
        scrollTop:0
      }, 800);
      event.preventDefault();
    });
  });
})

// ハンバーガーボタン
document.addEventListener("turbolinks:load", function() {
  $(function() {
      $('.hamburger').click(function() {
          $(this).toggleClass('active');

          if ($(this).hasClass('active')) {
              $('.globalMenuSp').addClass('active');
          } else {
              $('.globalMenuSp').removeClass('active');
          }
      });
  });
})

// google map
let map //変数の定義
let geocoder //変数の定義

// document.addEventListener("turbolinks:load", function() {
  function initMap(){ //コールバック関数
    geocoder = new google.maps.Geocoder() //GoogleMapsAPIジオコーディングサービスにアクセス
    if (document.getElementById('map')){ //'map'というidを取得できたら実行
      map = new google.maps.Map(document.getElementById('map'), { //'map'というidを取得してマップを表示
        center: {lat: 35.6594666, lng: 139.7005536}, //最初に表示する場所
        zoom: 15, //拡大率（1〜21まで設定可能）
      });
    }else if (document.getElementById('edit_map')){
      map = new google.maps.Map(document.getElementById('edit_map'), { //'edit_map'というidを取得してマップを表示
        center: {lat: gon.lat, lng: gon.lng}, //最初に表示する場所
        zoom: 15, //拡大率（1〜21まで設定可能）
      });
      $('.seach_button').click();
    }else{ //'map'というidが無かった場合
      map = new google.maps.Map(document.getElementById('show_map'), { //'show_map'というidを取得してマップを表示
        center: {lat: gon.lat, lng: gon.lng}, //controllerで定義した変数を緯度・経度の値とする
        zoom: 15, //拡大率（1〜21まで設定可能）
      });
　　　$('.seach_button').click();

      marker = new google.maps.Marker({ //GoogleMapにマーカーを落とす
        position:  {lat: gon.lat, lng: gon.lng}, //マーカーを落とす位置を決める（値はDBに入っている）
        map: map //マーカーを落とすマップを指定
      });
    }
  }
// })
// document.addEventListener("turbolinks:load", function() {
  function codeAddress(){ //コールバック関数
    let inputAddress = document.getElementById('address').value; //'address'というidの値（value）を取得

    geocoder.geocode( { 'address': inputAddress}, function(results, status) { //ジオコードしたい住所を引数として渡す
      if (status == 'OK') {
        let lat = results[0].geometry.location.lat(); //緯度
        let lng = results[0].geometry.location.lng(); //経度
        let mark = {
            lat: lat, //緯度
            lng: lng  //経度
        };
        map.setCenter(results[0].geometry.location); //最も近い、判読可能な住所を取得したい場所の緯度・経度
        let marker = new google.maps.Marker({
            map: map, //マーカーを落とすマップを指定
            position: results[0].geometry.location //マーカーを落とす位置を決める
        });
      } else {
        alert('該当する結果がありませんでした');
      }
    });
  }
// })

