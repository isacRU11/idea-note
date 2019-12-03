//= require jquery
//= require rails-ujs
//= require turbolinks
//= require popper
//= require bootstrap
//= require material
//= require_tree .

$(function(){

  // 対象の配列に値が存在するかのチェック
  function isArrayAnyMatch(arr, val) {
    return arr.some(function (arrVal) {
      return val === arrVal;
    });
  }

  // アイディア一覧の検索テキスト、またはチェックボックスが変化した直後にフォームサブミット実行
  $('#idea_search_form').on('keyup change', function(){
      $("#idea_search_form").find("input[type='submit']").click();
  });

  // アイディア一覧の検索テキスト、またはチェックボックスの変化で検索結果を制御
  $('#idea_search_form').on('ajax:success', function(event) {
      $("#idea_filter tr").each(function(idx, elm){
        if (isArrayAnyMatch(event.detail[0], $(elm).find("td:nth-child(2)").text())){
          $(elm).show();
        }else{
          $(elm).hide();
        }
      });
  });
});