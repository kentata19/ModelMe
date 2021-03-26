$(function () {
  $('.js-text_field').on('keyup', function () {
    var title = $.trim($(this).val());
    console.log(title);
    // 追加コード
    $.ajax({
      type: 'GET', // リクエストのタイプ
      url: '/rights/searches', // リクエストを送信するURL
      data:  { title: title }, // サーバーに送信するデータ
      dataType: 'json' // サーバーから返却される型
    })　
    
    .done(function (data) {
      $('.js-messages tr').remove();
      $('.js-messages th').remove();
      $(data).each(function(i,right) {
        $('.js-messages').append(
          `<tr>
            <th>
              <a href="/rights/${right.id}">
                <h7 class="text-center-community-name">${right.content}</h7> 
              </a>
            </th>  
          </tr>`
        );
      });
    })　
  });
});