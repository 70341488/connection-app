import consumer from "./consumer"

consumer.subscriptions.create("MessageChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `<p>${data.message.title}${data.category}${data.perfectures}${data.message.municipalities}${data.message.image}</p>`;
    const messages = document.getElementById('send');
    const newMessage = document.getElementById('message_title');('message_category_id');('message_prefectures_id');('message_municipalities');('message_image')
    messages.insertAdjacentHTML('afterbegin', html);
    newMessage.value='';
  }
});
