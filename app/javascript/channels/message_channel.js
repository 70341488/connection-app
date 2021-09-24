import consumer from "./consumer"

consumer.subscriptions.create("MessageChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },
 
  received(data) {
    const title = `<p>${data.message.title}</p>`;
    const createdAt = `<p>${data.message.created_at}</p>`;
    const nickName = `<p>${data.nickname}</p>`;
    const Category = `<p>${data.category}</p>`;
    const Area = `<p>${data.area}</p>`;
    const Municipalities = `<p>${data.message.municipalities}</p>`;
    
    
    const image = data.image;
    
    const html = `
    <div class="upper-message">
      <div class="message-user">
        <p>${nickName}</p>
      </div>
      <div class="message-date">
        <p>${createdAt}</p>
      </div>
    </div>
    <div class="lower-message">
      <div class="message-content">
        <p>${title}</p>
        <p>${Category}</p>
        <p>${Area}</p>
        <p>${Municipalities}</p>
        <img src="${image}" class="message-image">
      </div>
    </div>`
    const messages = document.getElementById('send');
    const newMessage = document.getElementById('image_list');('message_title');('message_category_id');('message_prefectures_id');('message_municipalities');('message_image');
    messages.insertAdjacentHTML('afterbegin', html);
    newMessage.value='';
  }
});
