import consumer from "channels/consumer"

const messageChanel = consumer.subscriptions.create("MessageChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    const messageDisplay = document.querySelector('#message-display')
    messageDisplay.insertAdjacentHTML('afterbegin', this.template(data))
  },

  template(data) {
    return `<article class="message">
              <div class="message-header">
                ${data.user.email}:
              </div>
              <div class="message-body">
                ${data.body}
              </div>
              <br>
            </article>`
  }
});
