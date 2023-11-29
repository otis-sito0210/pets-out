import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="activity-subscription"
export default class extends Controller
  { static values = { activityId: Number }
    static targets = ["meetings"]

connect() {
  this.channel = createConsumer().subscriptions.create(
    { channel: "ActivityChannel", id: this.activityIdValue },
    { received: data => console.log(data),
      received: data => this.#insertMessageAndScrollDown(data),
      }
    )
  console.log(`Subscribe to the activity with the id ${this.activityIdValue}.`)
}

  resetForm(event) {
    event.target.reset();
      }

  #insertMessageAndScrollDown(data) {
  if (this.meetingsTarget) {
    console.log(this.meetingsTarget);
    this.meetingsTarget.insertAdjacentHTML("beforeend", data)
    this.meetingsTarget.scrollTo(0, this.meetingsTarget.scrollHeight)
  } else {
    console.error("meetingsTarget is undefined.")
    }
  }

  disconnect() {
    console.log("Unsubscribed from the chatroom")
    this.channel.unsubscribe()
  }
}
