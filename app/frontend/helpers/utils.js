import moment from "moment"

const today = moment().startOf("day")
const thisWeek = moment().startOf("week")

export function formatDate(date) {
  const inputDate = moment(date)

  if (inputDate.isSame(today, "d")) {
    return inputDate.format("h:mm A") // Show time if it's today
  } else if (inputDate.isAfter(thisWeek)) {
    return inputDate.format("dddd") // Show the day of the week if it's this week
  } else {
    return inputDate.format("MMM D, YYYY") // Otherwise, show the date
  }
}
