  // $(document).ready(function () {
  //   var token = $('meta[name="csrf-token"]').attr('content');
  //   $.ajaxSetup({
  //     headers: {
  //       'X-CSRF-Token': token
  //     }
  //   });

  //   $('#open-chat').hide();

  //   $('#open-chat-btn').click(function(){
  //     $('#open-chat').toggle();
  //   });
  // //
  // // readyイベントはページ読み込み後すぐ実行されるやつ
  //   // jQueryの基本構文↓↓↓
  //   // ＄（セレクタ）.メソッド（）
  //   // 今回は"#chat-form"がsubmitイベントをおこなったとき
  //   // function(event)以下が実行される
  //   $('#chat-form').submit(function (event) {
  //   //   ➀まずイベント(submit)のデフォルトの処理(＝この場合、フォームの送信によるページの再読み込み)を消す
  //     event.preventDefault();

  //     // ➁#chat-inputの値を取り出して、定数inputに代入する
  //     // .val(): jQueryのメソッドの一つで、選択した要素の現在の値を取得します。
  //     const input = $('#chat-input').val();

  //     // ➂ボタンを消して、ロード中のやつを出す
  //     // d-noneはbootstrapの要素を非表示にするクラス
  //     $('#chat-btn').addClass('d-none');
  //     $('#chat-loader').removeClass('d-none');

  //     // ➃非同期POSTリクエストを発行
  //     $.post('/chatbots', {input: input})
  //     // $.postで非同期でHTTP POSTリクエストを送れる。
  //     // 基本構文は$.post(URL, params(つまりハッシュ))
  //     // inputという値をinputというキーでデータとして送信している。

  //     // ➄成功した際の処理
  //       .done(function (data) {
  //         // .doneで成功した際の処理
  //         // このコールバック関数は引数としてdata,statusなどがとれる
  //         // data=受信した応答データ

  //     // ➅受信したデータに対するチャットのレスポンスを定数responseに代入
  //         const response = data.response;

  //     // ⓻responseとinputをそれぞれHTML形式で表現してそれぞれ定数responseMessageとinputMessageとして代入
  //         const responseMessage = '<div class="chat__message chat__message--bot"><i class="fas fa-robot chat__bot-icon"></i><p class="alert alert-success" role="alert">' + response + '</p></div>';
  //         const inputMessage = '<div class="chat__message chat__message--user"><p class="alert alert-info" role="alert">' + input + '</p></div>';
  //       // responseMessageはチャットボットのメッセージを表現します。
  //       // <p class="alert alert-success" role="alert">' + response + '</p>でチャットボットの応答を表示するパラグラフを作成します。

  //       // ➆’代入したテキストたちを#chat-messagesに入れてあげて、inputのところを空欄にして、ロード中のやつとボタンをそれぞれ戻してあげる
  //         $('#chat-messages').append(responseMessage, inputMessage);
  //         // prepend()は、指定した要素の最初（上部）に新たな内容を追加するメソッド
  //         $('#chat-input').val('');
  //         $('#chat-loader').addClass('d-none');
  //         $('#chat-btn').removeClass('d-none');
  //       })

  //     // ⓼失敗した際の処理
  //       .fail(function (xhr, status, error) {
  //         // .failで失敗した際の処理
  //         // .failは引数としてjqXHR, status, errorを取ることができそれぞれxhrはXMLHttpRequestオブジェクト、status はリクエストのステータス、
  //         // そしてerrorはサーバーから返されるエラーメッセージ
  //         // AjaxのコアでもあるXMLHttpRequestオブジェクトに、jQuery固有の機能を追加したものです。非同期通信の詳細な挙動を制御する場合などに利用します。
  //         console.log("Error:", error)
  //         // ↑はデバッグのためにある

  //         const responseMessage = '<div class="chat__message chat__message--bot alert alert-danger" role="alert"><i class="fas fa-robot chat__bot-icon"></i><p>' + error + '</p></div>';
  //         const inputMessage = '<div class="chat__message chat__message--user alert alert-info" role="alert"><p>' + input + '</p></div>';

  //         $('#chat-messages').append(responseMessage, inputMessage);
  //         $('#chat-loader').addClass('d-none');
  //         $('#chat-btn').removeClass('d-none');
  //       });
  //   });
  // });