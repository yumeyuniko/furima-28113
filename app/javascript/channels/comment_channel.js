import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log(data)
    const html = `<p>${data.user_name}<br>${data.content.text}</p><a class="comment_delete" data-confirm="ほんとに消す?" rel="nofollow" data-method="delete" href="${data.content.item_id + '/comments/' + data.content.id}">削除</a>`;
    const comments = document.getElementById('comments');
    const newComment = document.getElementById('comment_text');
    comments.insertAdjacentHTML('afterbegin', html);
    newComment.value = '';
  }
});
