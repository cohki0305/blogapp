import $ from 'jquery'
import axios from 'axios'
import { csrfToken } from 'rails-ujs'

axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()

const listenInactiveHeartEvent = (articleId) => {
  $('.inactive_heart').on('click', () => {
    axios.post(`/articles/${articleId}/like`)
      .then((response) => {
        if (response.data.status === 'ok') {
          $('.active_heart').removeClass('hidden')
          $('.inactive_heart').addClass('hidden')
        }
      })
      .catch((e) => {
        window.alert('error')
      })
  })
}

const listenActiveHeartEvent = (articleId) => {
  $('.active_heart').on('click', () => {
    axios.delete(`/articles/${articleId}/like`)
      .then((response) => {
        if (response.data.status === 'ok') {
          $('.active_heart').addClass('hidden')
          $('.inactive_heart').removeClass('hidden')
        }
      })
      .catch((e) => {
        window.alert('error')
      })
  })
}

export {
  listenInactiveHeartEvent,
  listenActiveHeartEvent
}
